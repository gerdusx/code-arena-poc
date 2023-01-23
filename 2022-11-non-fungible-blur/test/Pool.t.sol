// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Pool.sol";
import "../src/ExecutionDelegate.sol";
import "../src/PolicyManager.sol";
import "../src/Exchange.sol";
import "../src/interfaces/IExchange.sol";

contract ContractTest is Test {
    Pool pool;
    ExecutionDelegate executionDelegate;
    PolicyManager policyManager;
    IExchange exchange;

    address alice = address(1);
    address bob = address(2);

    function setUp() public {
        pool = new Pool();
        executionDelegate = new ExecutionDelegate();
        policyManager = new PolicyManager();
        exchange = Exchange(0x707531c9999AaeF9232C8FEfBA31FBa4cB78d84a);

        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    function testPool() public {
        console.log("pool address: ", address(pool));
        console.log("executionDelegate address: ", address(executionDelegate));
        console.log("policyManager address: ", address(policyManager));
        console.log("exchange address: ", address(exchange));
        // console.log("exchange owner: ", exchange.owner());
        console.log("---------------");
        console.log("pool eth balance: ", address(pool).balance);
        console.log("alice eth balance: ", address(alice).balance);
        console.log("bob eth balance: ", address(bob).balance);
        console.log("---------------");
        console.log("Alice sending 1 eth to the pool");
        vm.prank(alice);
        pool.deposit{value: 1 ether}();
        console.log("---------------");
        console.log("pool eth balance: ", address(pool).balance);
        console.log("alice eth balance: ", address(alice).balance);
        console.log("bob eth balance: ", address(bob).balance);
        console.log("---------------");
    }
}