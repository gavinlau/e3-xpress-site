# 转储表 product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
                           `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                           `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
                           `title` varchar(256) DEFAULT '' COMMENT '标题',
                           `content` longtext COMMENT '内容',
                           `summary` text COMMENT '摘要',
                           `usp` text COMMENT '产品卖点',
                           `thumbnail` varchar(512) DEFAULT NULL COMMENT '缩略图',
                           `style` varchar(32) DEFAULT NULL COMMENT '样式',
                           `order_number` int(11) DEFAULT '0' COMMENT '排序编号',
                           `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
                           `origin_price` decimal(10,2) DEFAULT NULL COMMENT '原始价格',
                           `limited_price` decimal(10,2) DEFAULT NULL COMMENT '限时优惠价（早鸟价）',
                           `status` tinyint(2) DEFAULT NULL COMMENT '状态',
                           `comment_status` tinyint(1) DEFAULT '1' COMMENT '评论状态，默认允许评论',
                           `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论总数',
                           `comment_time` datetime DEFAULT NULL COMMENT '最后评论时间',
                           `view_count` int(11) unsigned DEFAULT '0' COMMENT '访问量',
                           `sales_count` int(11) unsigned DEFAULT '0' COMMENT '销售量，用于放在前台显示',
                           `buy_link` varchar(255) DEFAULT NULL COMMENT '购买链接',
                           `video_id` varchar(64) DEFAULT NULL COMMENT '视频ID',
                           `created` datetime DEFAULT NULL COMMENT '创建日期',
                           `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
                           `flag` varchar(64) DEFAULT NULL COMMENT '标识，通常用于对某几个商品进行标识，从而实现单独查询',
                           `meta_title` varchar(512) DEFAULT NULL COMMENT 'SEO标题',
                           `meta_keywords` varchar(512) DEFAULT NULL COMMENT 'SEO关键字',
                           `meta_description` varchar(512) DEFAULT NULL COMMENT 'SEO描述信息',
                           `remarks` text COMMENT '备注信息',
                           `options` text COMMENT 'json 扩展',
                           `site_id` int(11) unsigned DEFAULT NULL COMMENT '站点ID',
                           PRIMARY KEY (`id`) USING BTREE,
                           UNIQUE KEY `slug` (`slug`) USING BTREE,
                           KEY `created` (`created`) USING BTREE,
                           KEY `view_count` (`view_count`) USING BTREE,
                           KEY `order_number` (`order_number`) USING BTREE,
                           KEY `sales_count` (`sales_count`) USING BTREE,
                           KEY `status` (`status`) USING BTREE,
                           KEY `flag` (`flag`) USING BTREE,
                           KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品表';



# 转储表 product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
                                    `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                    `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类的ID',
                                    `user_id` int(11) unsigned DEFAULT NULL COMMENT '分类创建的用户ID',
                                    `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
                                    `title` varchar(512) DEFAULT NULL COMMENT '标题',
                                    `content` text COMMENT '内容描述',
                                    `summary` text COMMENT '摘要',
                                    `style` varchar(32) DEFAULT NULL COMMENT '模板样式',
                                    `type` varchar(32) DEFAULT NULL COMMENT '类型，比如：分类、tag、专题',
                                    `icon` varchar(128) DEFAULT NULL COMMENT '图标',
                                    `with_recommend` tinyint(1) DEFAULT NULL COMMENT '是否推荐',
                                    `with_top` tinyint(1) DEFAULT NULL COMMENT '是否置顶',
                                    `ornament` varchar(512) DEFAULT NULL COMMENT '装饰图',
                                    `thumbnail` varchar(512) DEFAULT NULL COMMENT '缩略图',
                                    `count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
                                    `order_number` int(11) DEFAULT '0' COMMENT '排序编码',
                                    `flag` varchar(64) DEFAULT NULL COMMENT '标识',
                                    `meta_title` varchar(256) DEFAULT NULL COMMENT 'SEO标题',
                                    `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
                                    `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
                                    `options` text,
                                    `created` datetime DEFAULT NULL COMMENT '创建日期',
                                    `modified` datetime DEFAULT NULL COMMENT '修改日期',
                                    `site_id` int(10) unsigned DEFAULT NULL COMMENT '站点ID',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    KEY `typeslug` (`type`,`slug`) USING BTREE,
                                    KEY `order_number` (`order_number`) USING BTREE,
                                    KEY `pid` (`pid`) USING BTREE,
                                    KEY `flag` (`flag`) USING BTREE,
                                    KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品分类表。标签、专题、类别等都属于category。';



# 转储表 product_category_mapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category_mapping`;

CREATE TABLE `product_category_mapping` (
                                            `product_id` int(11) unsigned NOT NULL COMMENT '商品ID',
                                            `category_id` int(11) unsigned NOT NULL COMMENT '分类ID',
                                            PRIMARY KEY (`product_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品和分类的多对多关系表';



# 转储表 product_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_comment`;

CREATE TABLE `product_comment` (
                                   `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                   `pid` int(11) unsigned DEFAULT NULL COMMENT '回复的评论ID',
                                   `product_id` int(11) unsigned DEFAULT NULL COMMENT '评论的产品ID',
                                   `user_id` int(11) unsigned DEFAULT NULL COMMENT '评论的用户ID',
                                   `author` varchar(128) DEFAULT NULL COMMENT '评论的作者',
                                   `content` text COMMENT '评论的内容',
                                   `reply_count` int(11) unsigned DEFAULT '0' COMMENT '评论的回复数量',
                                   `order_number` int(11) DEFAULT '0' COMMENT '排序编号，常用语置顶等',
                                   `vote_up` int(11) unsigned DEFAULT '0' COMMENT '“顶”的数量',
                                   `vote_down` int(11) unsigned DEFAULT '0' COMMENT '“踩”的数量',
                                   `status` tinyint(2) DEFAULT NULL COMMENT '评论的状态',
                                   `created` datetime DEFAULT NULL COMMENT '评论的时间',
                                   `site_id` int(11) unsigned DEFAULT NULL COMMENT '站点ID',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   KEY `product_id` (`product_id`) USING BTREE,
                                   KEY `user_id` (`user_id`) USING BTREE,
                                   KEY `status` (`status`) USING BTREE,
                                   KEY `pid` (`pid`) USING BTREE,
                                   KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品评论表';



# 转储表 product_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                 `product_id` int(11) unsigned NOT NULL,
                                 `src` varchar(512) NOT NULL,
                                 `order_number` int(11) DEFAULT NULL,
                                 `created` datetime DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 KEY `productid` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='产品图片表';

