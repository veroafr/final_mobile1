package com.example.demo;

class PetNotFoundException extends RuntimeException {
  PetNotFoundException(Long id) {
    super("Could not find pet " + id);
  }
}
