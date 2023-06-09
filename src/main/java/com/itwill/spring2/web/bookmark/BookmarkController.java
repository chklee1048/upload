package com.itwill.spring2.web.bookmark;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.itwill.spring2.domain.User;
import com.itwill.spring2.dto.BookmarkDto;
import com.itwill.spring2.repository.BookmarkRepository;
import com.itwill.spring2.service.BookmarkService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/bookmark")
public class BookmarkController {
    
    private final BookmarkRepository bookmarkRepository;
    
    @GetMapping("/bookmarkAdd")
    public ResponseEntity<String> addBookmark(@RequestParam("restaurant_id") long restaurant_id,
            @RequestParam("username") String username) {
        log.info("addBookmark={}",restaurant_id);
        
        bookmarkRepository.BookmarkOn(restaurant_id, username);
        return ResponseEntity.ok("Bookmark added successfully");
    }
    
    @PostMapping("/remove")
    public ResponseEntity<String> removeBookmark(@RequestParam ("restaurant_id") long restaurant_id,
    @RequestParam("username") String username) {
        
        bookmarkRepository.BookmarkOff(restaurant_id, username);
        return ResponseEntity.ok("Bookmark removed successfully");
    }
    
    @GetMapping("/status")
    public ResponseEntity<Boolean> getBookmarkStatus (@RequestParam ("restaurant_id") long restaurant_id,
            @RequestParam("username") String username) {
        long bookmarkStatus = bookmarkRepository.MyBookmark(restaurant_id, username);
        boolean isBookmarked = bookmarkStatus > 0;
        
        return ResponseEntity.ok(isBookmarked);
        
    }
    
    @PostMapping("/mugmung/user/signin")
    public String signIn() {
        log.info("POST:signIn()");
        
        return "signin";
    }

}
