package me.lhy.userservice.controller;

import me.lhy.common.Result;
import me.lhy.userservice.domain.po.User;
import me.lhy.userservice.service.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/id/{id}")
    public Result getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return Result.success(user);
    }

    @GetMapping("/username/{username}")
    public Result getUserByUsername(@PathVariable String username) {
        User user = userService.getUserByUsername(username);
        return Result.success(user);
    }

    @GetMapping("/all")
    public Result getUserList() {
        return Result.success(userService.getUserList());
    }

    @PostMapping("/save")
    public Result saveUser(@RequestBody User user) {
        userService.saveUser(user);
        return Result.success();
    }
}
