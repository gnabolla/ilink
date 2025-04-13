<?php
require_once 'config/config.php';

class AccountsRental {
    private $db;

    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }

    public function getAllAccounts() {
        try {
            $stmt = $this->db->query("SELECT * FROM accounts_rentals ORDER BY LCode DESC");
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch(PDOException $e) {
            return [];
        }
    }
}