create table `Roles` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(255),
    `description` VARCHAR(255),
     
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     
)	
INSERT INTO `Roles` (`name`, `description`) VALUES
('ROLE_ ADMIN', 'Quản trị hệ thống'),
('ROLE_ USER', 'Người dùng hệ thống')


create table `User` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `fullName`  VARCHAR(255),
    `email` VARCHAR(255),
    `password` VARCHAR(255),
    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     

)
INSERT INTO `User` ( `fullName`, `email`, `password`) VALUES
('Khach A', 'khachA@gmail.com', '1234'),
('Khach B', 'khachB@gmail.com', '1234'),
('Khach C', 'khachC@gmail.com', '1234'),
('Khach D', 'khachD@gmail.com', '1234'),
('Khach E', 'khachE@gmail.com', '1234')


create table `Restaurant` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `resName`  VARCHAR(255),
    `image` VARCHAR(255),
    `description` VARCHAR(255),
    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     

) 
INSERT INTO `Restaurant` (`resName`, `image`, `description` ) VALUES
('Nha Hang 1', ' Hinh Anh 1', 'Dep' ),
('Nha Hang 2', ' Hinh Anh 2', 'Dep' ),
('Nha Hang 3', ' Hinh Anh 3', 'Dep' ),
('Nha Hang 4', ' Hinh Anh 4', 'Dep' ),
('Nha Hang 5', ' Hinh Anh 5', 'Dep' )


create table `ReteRestaurant` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `userId` INT NOT NULL,
    `resId`  INT NOT NULL,
    `amount` INT NOT NULL,
    `dateRate` DATETIME NOT NULL,
    
    FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
    FOREIGN KEY (`resId`) REFERENCES `Restaurant` (`id`),
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     
)
INSERT INTO `ReteRestaurant` (`userId`, `resId`, `amount`, `dateRate`) VALUES
(2,1,4,'2025-03-20 18:30:00'),
(1,3,3,'2025-03-20 19:30:00'),
(3,4,5,'2025-03-20 20:30:00'),
(4,2,3,'2025-03-20 22:30:00')

create table `LikeRate` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `userId` INT NOT NULL,
    `resId` INT NOT NULL,
    `dateLike` DATETIME NOT NULL,
    
    FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
    FOREIGN KEY (`resId`) REFERENCES `Restaurant` (`id`),

     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     

)
INSERT INTO `LikeRate` (`userId`, `resId`, `dateLike`) VALUES
(1, 1, '2025-03-20 10:00:00'),
(2, 1, '2025-03-21 12:00:00'),
(1, 2, '2025-03-22 15:30:00'),
(2, 5, '2025-03-23 16:45:00'),
(3, 2, '2025-03-23 16:45:00'),
(3, 5, '2025-03-23 12:45:00'),
(4, 4, '2025-03-23 14:25:00'),
(4, 1, '2025-03-23 13:35:00'),
(5, 1, '2025-03-23 15:15:00'),
(2, 1, '2025-03-23 15:15:00'),
(3, 1, '2025-03-23 15:15:00'),
(5, 2, '2025-03-23 15:15:00')




create table `TypeFood` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `typeName` VARCHAR(255),
    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     

)
INSERT INTO `TypeFood` (`typeName`) VALUES
('Món Việt'),
('Món Âu'),
('Món Nhật'),
('Món Hàn'),
('Món Trung')

create table `Food` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `foodName`  VARCHAR(255),
    `image` VARCHAR(255),
    `price` FLOAT NOT NULL,
    `description` VARCHAR(255),
    `typeId` INT NOT NULL,
    
    FOREIGN KEY (`typeId`) REFERENCES `TypeFood` (`id`),
    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     

)
INSERT into `Food` ( `foodName`, `image` , `price` , `description`, `typeId`) VALUES
('Phở Bò', 'pho_bo.jpg', 5.99, 'Món phở truyền thống', 1),
('Pizza Margherita', 'pizza.jpg', 8.50, 'Pizza Ý chính thống', 2),
('Sushi Cá Hồi', 'sushi.jpg', 12.00, 'Sushi Nhật tươi ngon', 3)


create table `SubFood` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `subName`  VARCHAR(255),
    `subPrice` FLOAT NOT NULL,
    `foodId` INT NOT NULL,
    
    FOREIGN KEY (`foodId`) REFERENCES `Food` (`id`),
    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `SubFood` (`subName`, `subPrice`, `foodId`) VALUES
('Thêm trứng', 1.00, 1),
('Thêm phô mai', 1.50, 2),
('Thêm gừng ngâm', 0.50, 3)

create table `Order` (
    `orderId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `userId` INT NOT NULL,
    `foodId` INT NOT NULL,
    `amout` INT,
    `code` VARCHAR(255),
    `arrSubId` VARCHAR(255),
    
    FOREIGN KEY (`foodId`) REFERENCES `Food` (`id`),
    FOREIGN KEY (`UserId`) REFERENCES `User` (`id`),

    
     
     `deleteBy` INT NOT NULL DEFAULT 0,
     `isDelete` TINYINT(1) NOT NULL DEFAULT 0,
     `deleteAt` TIMESTAMP NULL DEFAULT NULL,
     `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updateAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    
)
INSERT INTO `Order` (`userId`, `foodId`, `amout` , `code`, `arrSubId`) VALUES
(1, 1, 2, 'ORD123', '1,3'),
(2, 2, 1, 'ORD124', '2'),
(3, 3, 3, 'ORD125', '1'),
(3, 2, 1, 'ORD121', '3'),
(1, 2, 1, 'ORD123', '2'),
(2, 1, 1, 'ORD122', '2'),
(3, 3, 3, 'ORD125', '1')

--Bài 1: Tìm 5 người like nhà hàng nhiều nhất

SELECT * FROM `LikeRate`

SELECT COUNT(`userId`) AS 'Số lần like',`userId`, `email`
FROM `LikeRate`
INNER JOIN `User` ON `User`.id = `LikeRate`.userId
GROUP BY `userId`
ORDER BY `userId` ASC

--Bài 2: Tìm 2 nhà hàng có lượt like nhiều nhất

SELECT * FROM `Restaurant`
SELECT `resId`, `resName`, COUNT(`LikeRate`.id) AS 'Tổng số lượt like'
FROM `Restaurant`
INNER JOIN `LikeRate` ON `LikeRate`.userId = `Restaurant`.id
GROUP BY `resId`, `resName`
ORDER BY 'Tổng số lượt like' DESC
LIMIT 2;

--Bài 3: Tìm người đặt hàng nhiều nhất
SELECT `userId`, `fullName`, `email`, COUNT(`orderId`) AS 'Tổng đơn đã đặt'
FROM `Order` 
INNER JOIN `User` ON `User`.id = `Order`.userId
GROUP BY `userId`,`fullName`,`email`
ORDER BY 'Tổng đơn đã đặt' DESC
LIMIT 1;

--Bài 4 : Tìm người dùng không hoạt động ( không đặt hàng, không like, không đánh giá nhà hàng) 
SELECT `User`.id, `fullName`
FROM `User`
LEFT JOIN `Order` ON `User`.id = `Order`.userId
LEFT JOIN `LikeRate` ON `User`.id = `LikeRate`.userId
LEFT JOIN `ReteRestaurant` ON `User`.id = `ReteRestaurant`.userId
WHERE `Order`.orderId IS NULL AND `LikeRate`.id IS NULL AND `ReteRestaurant`.id IS NULL;


