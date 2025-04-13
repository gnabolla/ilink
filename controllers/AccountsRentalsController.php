<?php
require_once 'models/AccountsRental.php';

class AccountsRentalsController {
    private $accountsRental;

    public function __construct() {
        $this->accountsRental = new AccountsRental();
    }

    public function index() {
        $accounts = $this->accountsRental->getAllAccounts();
        require_once 'views/accounts_rentals/index.php';
    }
}