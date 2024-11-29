package com.example.spring_native_image.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api")
class AppController {
    @GetMapping("")
    fun sayHelloWorld() = "Hello world"
}