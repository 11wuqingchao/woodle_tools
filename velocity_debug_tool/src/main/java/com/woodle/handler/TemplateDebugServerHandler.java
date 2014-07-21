package com.woodle.handler;


import static org.jboss.netty.handler.codec.http.HttpHeaders.Names.CONTENT_TYPE;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.BAD_REQUEST;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.INTERNAL_SERVER_ERROR;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.OK;
import static org.jboss.netty.handler.codec.http.HttpVersion.HTTP_1_1;

import com.woodle.common.CommonConstants;
import com.woodle.service.RenderService;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.buffer.DynamicChannelBuffer;
import org.jboss.netty.channel.*;
import org.jboss.netty.handler.codec.frame.TooLongFrameException;
import org.jboss.netty.handler.codec.http.*;
import org.jboss.netty.util.CharsetUtil;

/**
 *
 * User: wuqingchao
 * Time: 14-5-11 下午9:59
 */
public class TemplateDebugServerHandler extends SimpleChannelUpstreamHandler{

    private RenderService renderingService;

    public TemplateDebugServerHandler(){
        this.renderingService = new RenderService();
    }

    @Override
    public void messageReceived(ChannelHandlerContext ctx, MessageEvent e) throws Exception {
        HttpRequest request = (HttpRequest) e.getMessage();

        HttpResponse response = new DefaultHttpResponse(HTTP_1_1, OK);
        response.setHeader("Content-Type", "text/html; charset=UTF-8");
        ChannelBuffer buffer= new DynamicChannelBuffer(2048);

        /**
         * 只支持GET请求
         */
        if (request.getMethod() != HttpMethod.GET) {
            System.out.println("invalde request method, only GET request supported");
            buffer.writeBytes(CommonConstants.INVALID_REQUST_METHOD.getBytes());

        }  else {
            String uri = request.getUri();
            System.out.println("request uri:" + uri);

            String view = renderingService.Rendering(uri);
            buffer.writeBytes(view.getBytes("UTF-8"));
        }
        response.setContent(buffer);
        response.setHeader("Content-Length", response.getContent().writerIndex());

        Channel ch = e.getChannel();
        ch.write(response);
        ch.disconnect();
        ch.close();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, ExceptionEvent e) throws Exception {
        Channel ch = e.getChannel();
        Throwable cause = e.getCause();
        if (cause instanceof TooLongFrameException) {
            sendError(ctx, BAD_REQUEST);
            return;
        }

        cause.printStackTrace();
        if (ch.isConnected()) {
            sendError(ctx, INTERNAL_SERVER_ERROR);
        }
    }

    private void sendError(ChannelHandlerContext ctx, HttpResponseStatus status) {
        HttpResponse response = new DefaultHttpResponse(HTTP_1_1, status);
        response.setHeader(CONTENT_TYPE, "text/plain; charset=UTF-8");
        response.setContent(ChannelBuffers.copiedBuffer("Failure: " + status.toString() + "\r\n", CharsetUtil.UTF_8));
        ctx.getChannel().write(response).addListener(ChannelFutureListener.CLOSE);
    }


}
