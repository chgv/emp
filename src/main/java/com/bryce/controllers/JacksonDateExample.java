package com.bryce.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class JacksonDateExample {
    public static void main(String[] args) {
        ObjectMapper objectMapper = new ObjectMapper();

        // 注册 Java Time Module
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);

        // 设置时区
        objectMapper.setTimeZone(TimeZone.getTimeZone("UTC"));

        // 设置日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        objectMapper.setDateFormat(dateFormat);

        // 示例：序列化和反序列化
        try {
            String json = "{\"date\":\"2024-06-05 16:20:24\"}";
            MyDateClass myDate = objectMapper.readValue(json, MyDateClass.class);
            System.out.println("Parsed date: " + myDate.getDate());

            String serialized = objectMapper.writeValueAsString(myDate);
            System.out.println("Serialized date: " + serialized);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static class MyDateClass {
        private java.time.LocalDateTime date;

        public java.time.LocalDateTime getDate() {
            return date;
        }

        public void setDate(java.time.LocalDateTime date) {
            this.date = date;
        }
    }
}
