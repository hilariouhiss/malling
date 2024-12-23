package me.lhy.userservice.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.lhy.userservice.domain.po.User;
import me.lhy.userservice.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    private final UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User getUserById(Long id) {
        return userMapper.selectById(id);
    }

    public User getUserByUsername(String username) {
        return userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username));
    }

    public List<User> getUserList() {
        return userMapper.selectList(null);
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveUser(User user) {
        if (user.getId() != null) {
            userMapper.updateById(user);
            return;
        }
        userMapper.insert(user);
    }
}
