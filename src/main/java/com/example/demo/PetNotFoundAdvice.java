package com.example.demo;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@ControllerAdvice
class PetNotFoundAdvice {

  @ResponseBody
  @ExceptionHandler(PetNotFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  String petNotFoundHandler(PetNotFoundException ex) {
    return ex.getMessage();
  }
}
