package com.morning.util;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

@Configuration
@EnableWebSocket
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketConfigurer, WebSocketMessageBrokerConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//        registry.addHandler(customWebSocketHandler(), "/socket.do")
//        .setAllowedOrigins("*")
//        .addInterceptors(new HttpSessionHandshakeInterceptor());
//        
//        registry.addHandler(customWebSocketHandler(), "/socket2.do")
//                .setAllowedOrigins("*")
//                .addInterceptors(new HttpSessionHandshakeInterceptor());
//        
//        registry.addHandler(customWebSocketHandler(), "/socket3.do")
//        .setAllowedOrigins("*")
//        .addInterceptors(new HttpSessionHandshakeInterceptor());
//        
//        registry.addHandler(customWebSocketHandler(), "/socket4.do")
//        .setAllowedOrigins("*")
//        .addInterceptors(new HttpSessionHandshakeInterceptor());
        
    }

    @Bean
    public CustomWebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }
    
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
    
    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean(); // (3)
        //container.setMaxTextMessageBufferSize(500000);
        container.setMaxBinaryMessageBufferSize(500000); // 바이너리 메세지의 최대크기 지정(오류방지용)
        return container;
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/subscribe");
        config.setApplicationDestinationPrefixes("/app");
    }
    
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/endpoint").withSockJS();
    }
    
}