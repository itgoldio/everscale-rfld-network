// SPDX-License-Identifier: MIT
// Itgold Contracts (last updated 14.06.22)
pragma ton-solidity = 0.58.1;

pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

// This contract can be deployed into any TVM compatible network
// See https://docs.tonalliance.org/developing/ton-virtual-machine
contract CheckNetwork {

    /**
    * Errors
    **/
    uint8 constant recently_checked = 101;

    // Timestamp of previous check
    uint128 public _prevCheck;
    // Time in seconds after which the check method can be called again
    uint128 _cooldown;

    event NetworkIsChecked(uint128 currentTimestamp, uint128 prevCheck);

    constructor(uint128 cooldown) public {
        tvm.accept();

        _cooldown = cooldown;
    }

    // This method works at the expense of the contract and anyone can call it.
    // This method can be called only after a certain number of seconds from the last call (uint128 _cooldown).
    // This method will emit the event with the time of the previous and current call.
    function check() external {
        require(_prevCheck + _cooldown < now, recently_checked);
        tvm.accept();

        emit NetworkIsChecked(now, _prevCheck);
        _prevCheck = now;
    }

}
