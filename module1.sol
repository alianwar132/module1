// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyHome {
    uint private FatherSalary;
    uint private SchoolFees;
    uint private HomeExpenses;
    uint private PocketMoney;

    function setExpenses(uint _fatherSalary, uint _SchoolFees,uint _HomeExpenses) public {
         FatherSalary = _fatherSalary; 
         SchoolFees = _SchoolFees;
         HomeExpenses = _HomeExpenses;

         if(FatherSalary<SchoolFees + HomeExpenses){
            revert("Salary must be greater than expenses"); // Here revert function stop father to Pay Expenses if greater than his salary.
         }
    }
    
    function Children_PocketMoney(uint _PocketMoney) public {
        require(PocketMoney < 100, "Children Should have to spent less");  // Require ensures that children pocketmoney is less than 100 dollars.
        PocketMoney  = _PocketMoney;
        
    }

    function Salary_Remaining() public view returns (uint) {
        uint remainingSalary = FatherSalary - SchoolFees - HomeExpenses - PocketMoney;

        assert(remainingSalary < FatherSalary); // After the expenses, remaining salary must be less than the initial Salary.
        return remainingSalary;
    }
}