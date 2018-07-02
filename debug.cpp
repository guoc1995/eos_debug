#include <eosiolib/eosio.hpp>
  
class debug : public eosio::contract {
  public:
      using contract::contract;

      // @abi action
      void debugfunc( account_name from, account_name to, uint64_t amount ) {
         auto header = "======== debugfunc ========";
         eosio::print( header, "\n" );
         eosio::print( "from = ", from, "  to = ", to, "  amount = ", amount, "\n" );
         eosio::print( "from = ", eosio::name{from}, "  to = ", eosio::name{to}, "  amount = ", amount, "\n" );
      }
};

EOSIO_ABI( debug, (debugfunc) )