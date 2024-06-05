package com.bryce.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   @RequestParam("text") String text) {
        String fileName = file.getOriginalFilename();
        System.out.println("Textarea content: " + text);
        return "uploadSuccess";
    }
}
