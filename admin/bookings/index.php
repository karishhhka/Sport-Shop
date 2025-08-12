<?php 
session_start();

if (!isset($_SESSION['authenticated']) || $_SESSION['authenticated'] !== true || !isset($_SESSION['is_admin']) || $_SESSION['is_admin'] !== true) {
    header("Location: ../index.html"); 
    exit;
}
require '../../database/db.php';
$stmt = $pdo->query("SELECT b.*, u.name as username, p.name as productname 
                     FROM Bookings b 
                     JOIN User u ON b.id_user = u.id_user 
                     JOIN Products p ON b.id_product = p.id_product");
$bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../style.css">
    <title>Бронирования</title>
</head>
<body>
<div class="container">
    <header>
        <div class="adpanel">
            <h1 class="adpanel-h1">Админ-панель</h1>
        </div>
    </header>
    <div class="infopole">
        <div class="infopole-blok"> 
            <a href="../../admin/index.php" class="infopole-text">Админ-панель</a>
            <p class="infopole-text">-</p>
            <a href="../../index.html" class="infopole-text">Главная</a>
        </div>
    </div>
    <div class="admin-info">
        <div class="adminitems">
            <div class="adminitems-cont"><a class="adminitems-cont-a active" href="index.php">Bookings</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../brand/index.php">Brand</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../categories/index.php">Categories</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../color/index.php">Color</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../products/index.php">Products</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../user/index.php">User</a></div>
            <div class="adminitems-cont"><a class="adminitems-cont-a" href="../../logout.php">Выйти</a></div>
        </div>
        <div class="admin-dashboard">
            <h2 class="dashboard-title">Бронирования</h2>
            <a href="add.php" class="btn btn-add">Добавить</a>
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Пользователь</th>
                    <th>Товар</th>
                    <th>Кол-во</th>
                    <th>Статус</th>
                    <th>Действия</th>
                </tr>
                <?php foreach ($bookings as $b): ?>
                <tr>
                    <td><?= htmlspecialchars($b['id_booking']) ?></td>
                    <td><?= htmlspecialchars($b['username']) ?></td>
                    <td><?= htmlspecialchars($b['productname']) ?></td>
                    <td><?= htmlspecialchars($b['quantity']) ?></td>
                    <td><?= htmlspecialchars($b['status']) ?></td>
                    <td>
                        <a href="edit.php?id=<?= $b['id_booking'] ?>" class="btn btn-edit">Редактировать</a>
                        <a href="delete.php?id=<?= $b['id_booking'] ?>" onclick="return confirm('Удалить?')" class="btn btn-delete">Удалить</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>
</div>
</body>
</html>