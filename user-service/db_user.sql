create database db_user charset utf8mb4 collate utf8mb4_unicode_ci;
use db_user;
create table if not exists user
(
    id           BIGINT comment "主键，mybatis-plus 雪花算法生成",
    username     VARCHAR(50) Unique NOT NULL comment "用户名",
    password     VARCHAR(50)        NOT NULL comment "密码",
    phone_number char(11) Unique    NOT NULL comment "手机号",
    created_at   datetime DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at   datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted   TINYINT  DEFAULT 0 comment "是否删除，1则删除",
    primary key pk_user_id (id),
    index idx_user_id (id),
    index idx_user_username (username),
    index idx_user_phone_number (phone_number)
);

create table if not exists user_info
(
    id         BIGINT AUTO_INCREMENT comment "主键",
    user_id    BIGINT NOT NULL comment "用户id",
    nickname   VARCHAR(50) DEFAULT '默认用户名' comment "昵称",
    avatar     VARCHAR(255) comment "头像URL",
    address    VARCHAR(255) comment "地址",
    hobby      VARCHAR(255) comment "爱好",
    created_at datetime    DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted TINYINT     DEFAULT 0 comment "是否删除",
    PRIMARY KEY pk_user_info_id (id),
    index idx_user_info_user_id (user_id)
);

create table if not exists role
(
    id         BIGINT AUTO_INCREMENT comment "主键",
    name       VARCHAR(50) Unique NOT NULL comment "角色名",
    created_at datetime DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted TINYINT  DEFAULT 0 comment "是否删除",
    PRIMARY KEY pk_role_id (id),
    index idx_role_name (name)
);

create table if not exists user_role
(
    id         BIGINT AUTO_INCREMENT comment "主键",
    user_id    BIGINT comment "用户id",
    role_id    BIGINT comment "角色id",
    created_at datetime DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted TINYINT  DEFAULT 0 comment "是否删除",
    PRIMARY KEY pk_user_role_id (id),
    index idx_user_role_user_id (user_id),
    index idx_user_role_role_id (role_id)
);

create table if not exists permission
(
    id         BIGINT AUTO_INCREMENT comment "主键",
    name       VARCHAR(50) Unique NOT NULL comment "权限名",
    created_at datetime DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted TINYINT  DEFAULT 0 comment "是否删除",
    PRIMARY KEY pk_permission_id (id),
    index idx_permission_name (name)
);

create table if not exists role_permission
(
    id            BIGINT AUTO_INCREMENT comment "主键",
    role_id       BIGINT comment "角色id",
    permission_id BIGINT comment "权限id",
    created_at    datetime DEFAULT CURRENT_TIMESTAMP comment "创建时间",
    updated_at    datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment "更新时间",
    deleted    TINYINT  DEFAULT 0 comment "是否删除",
    PRIMARY KEY pk_role_permission_id (id),
    index idx_role_permission_role_id (role_id),
    index idx_role_permission_permission_id (permission_id)
);