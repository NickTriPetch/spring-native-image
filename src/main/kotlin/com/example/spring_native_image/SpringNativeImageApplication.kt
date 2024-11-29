package com.example.spring_native_image

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SpringNativeImageApplication

fun main(args: Array<String>) {
	runApplication<SpringNativeImageApplication>(*args)
}
