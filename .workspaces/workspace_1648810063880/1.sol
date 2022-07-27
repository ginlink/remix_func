// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.11;


interface frax  {

    // uint256 public constant GENESIS_SUPPLY = 2000000e18; // 2M FRAX (only for testing, genesis supply will be 5k on Mainnet). This is to help with establishing the Uniswap pools, as they need liquidity
    // // Constants for various precisions
    // uint256 private constant PRICE_PRECISION = 1e6;

    // enum PriceChoice {FRAX, FXS}
    // ChainlinkETHUSDPriceConsumer private ethUsdPricer;
    // uint8 private ethUsdPricerDecimals;
    // UniswapPairOracle private fraxEthOracle;
    // UniswapPairOracle private fxsEthOracle;

    // address public fxsAddress;
    // address public fraxEthOracleAddress;
    // address public fxsEthOracleAddress;
    // address public weth;
    // address public ethUsdConsumerAddress;


    // The addresses in this array are added by the oracle and these contracts are able to mint frax
    // address[] public fraxPoolAddress;

    // // Mapping is also used for faster verification
    // mapping(address => bool) public isFraxPools;


    // uint256 public globalCollateralRatio; // 6 decimals of precision, e.g. 924102 = 0.924102
    // uint256 public redemptionFee; // 6 decimals of precision, divide by 1000000 in calculations for fee
    // uint256 public mintingFee; // 6 decimals of precision, divide by 1000000 in calculations for fee
    // uint256 public fraxStep; // Amount to change the collateralization ratio by upon refreshCollateralRatio()
    // uint256 public refreshCooldown; // Seconds to wait before being able to run refreshCollateralRatio() again
    // uint256 public priceTarget; // The price of FRAX at which the collateral ratio will respond to; this value is only used for the collateral ratio mechanism and not for minting and redeeming which are hardcoded at $1
    // uint256 public priceBand; // The bound above and below the price target at which the refreshCollateralRatio() will not change the collateral ratio

    // uint256 public lastCallTime; // Last time the refreshCollateralRatio function was called



    /* ========== CONSTRUCTOR ========== */



    function pool_count() external view returns (uint256) ;


    // Returns X FRAX = 1 USD
    function stablePrice() external view returns (uint256) ;

    // // Returns X FXS = 1 USD
    function stockPrice() external view returns (uint256) ;

    function ethUsdPrice() external view returns (uint256);
    function duration() external view returns (uint256);

    // // This is needed to avoid costly repeat calls to different getter functions
    // // It is cheaper gas-wise to just dump everything and only use some of the info
    function fraxInfo() external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256) ;


    // // Iterate through all frax pools and calculate all value of collateral in all pools globally 
    function globalCollateralRatio() external view returns (uint256) ;


    function refreshCollateralRatio() external;

    // /* ========== RESTRICTED FUNCTIONS ========== */

    // // Used by pools when user redeems
    function poolBurnFrom(address b_address, uint256 b_amount) external ;

    // // This function is what other frax pools will call to mint new FRAX 
    function poolMint(address m_address, uint256 m_amount) external ;

    // // Adds collateral addresses supported, such as tether and busd, must be ERC20 
    // function addPool(address pool_address) external ;
    function addPool(address _pool, uint256 _n_coins, address _lp_token, uint256 _decimals, string memory _name) external;
    function mint(address _pool, uint256 _n_coins) external;
    


    // // Remove a pool 
    function removePool(address pool_address) external ;

    function setRedemptionFee(uint256 red_fee) external ;
    function setMintingFee(uint256 min_fee) external ;

    function setPoolParameters(uint256 _ceiling,
        uint256 _bonusRate,
        uint256 _redemptionDelay,
        uint256 _mintFee,
        uint256 _redeemFee,
        uint256 _buybackFee,
        uint256 _recollatFee) external ;

    function poolCeiling() external view returns(uint256);
    function bonusRate() external view returns(uint256);
    function redemptionDelay() external view returns(uint256);
    function mintingFee() external view returns(uint256);
    function redemptionFee() external view returns(uint256);
    function buybackFee() external view returns(uint256);
    function recollatFee() external view returns(uint256);

    function setFraxStep(uint256 _new_step) external ;

     function fraxStep() external view returns(uint256);

     function mid_fee() external view returns(uint256);
     function out_fee() external view returns(uint256);
     function fee() external view returns(uint256);



    function setPriceTarget(uint256 _new_price_target) external ;

    function setRefreshCooldown(uint256 _new_cooldown) external ;
    function setFXSAddress(address _fxs_address) external;


    function setETHUSDOracle(address _eth_usd_consumer_address) external ;

    function setPriceBand(uint256 _price_band) external ;

    // // Sets the FRAX_ETH Uniswap oracle address 
    function setFRAXEthOracle(address _frax_oracle_addr, address _weth_address) external ;

    // // Sets the FXS_ETH Uniswap oracle address 
    function setFXSEthOracle(address _fxs_oracle_addr, address _weth_address) external ;

     function isFraxPools(address) external view returns(bool);


    function fraxPoolAddress(uint256) external view returns(address);

    function fraxEthOracleAddress() external view returns(address);

     function fxsEthOracleAddress() external view returns(address);


         function refreshCooldown() external view returns(uint256);

            function setFraxAddress(address _address) external;



    function fraxPoolAddressCount() external view returns (uint256);

    function globalCollateralValue() external view returns (uint256);
    function collatDollarBalance() external view returns (uint256);
    function unclaimedPoolCollateral() external view returns (uint256);

    function getLatestPrice() external view returns (int);



    function balanceOf(address account) external view returns (uint256);

    function totalSupply() external view returns (uint);
    function balanceOfNFT(uint _tokenId) external view returns (uint);
    function blockTimestampLast() external view returns (uint);

    function setPeriod(uint _period) external;

    function approve(address spender, uint value) external returns (bool);

    function updatePool(uint256 _pid) external;
    function getReward(address account, address[] memory tokens) external;
    function votes(uint256 tokenId, address gauge) external view returns (uint256);
    function gauges(address lp_addr) external view returns (address);
    function coins(uint256) external view returns (address);
    function underlying_coins(uint256) external view returns (address);
    

}