package com.woodle.server;

import java.net.InetSocketAddress;
import java.util.concurrent.Executors;

import com.woodle.common.CommonConstants;
import com.woodle.handler.TemplateDebugServerHandler;
import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelPipelineFactory;
import org.jboss.netty.channel.Channels;
import org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory;
import org.jboss.netty.handler.codec.http.HttpRequestDecoder;
import org.jboss.netty.handler.codec.http.HttpResponseEncoder;


/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-10 下午7:07
 */
public class TemplateDebugServer {

    public static void main(String[] strings) {
          start(CommonConstants.PORT_LISTENED);
    }

    public static void start(int port) {
        ServerBootstrap serverBootstrap = new ServerBootstrap(
                new NioServerSocketChannelFactory(Executors.newCachedThreadPool(), Executors.newCachedThreadPool()));
        serverBootstrap.setPipelineFactory(new ServerPipelineFactory());
        serverBootstrap.bind(new InetSocketAddress(port));
        System.out.println("admin server start!!! listening port: "+port);
    }

    private static class ServerPipelineFactory implements ChannelPipelineFactory {
        public ChannelPipeline getPipeline() throws Exception {
            // Create a default pipeline implementation.
            ChannelPipeline pipeline = Channels.pipeline();
            pipeline.addLast("decoder", new HttpRequestDecoder());
            pipeline.addLast("encoder", new HttpResponseEncoder());
            //http处理handler
            pipeline.addLast("handler", new TemplateDebugServerHandler());
            return pipeline;
        }
    }

}
