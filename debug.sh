#! /bin/bash
set -e
set -u
set -o pipefail


# docker run -t -i -v /Users/guoguo/Desktop:/hostdata  eosio/eos-dev /bin/bash
# docker run -t -i -v /home/guochen/Desktop:/hostdata  eosio/eos-dev /bin/bash
# eosiocpp -o debug.wast debug.cpp
# eosiocpp -g debug.abi debug.cpp



cleos="docker-compose exec keosd /opt/eosio/bin/cleos -u http://nodeosd:8888 --wallet-url http://localhost:8888"

echo "---------------- Start Docker! ----------------";
docker-compose up -d


echo "---------------- Create A Wallet! ----------------";
${cleos} wallet create


echo "---------------- Import Test Key! ----------------";
${cleos} wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


echo "---------------- Create Test Account! ----------------";
${cleos} create account eosio 12345tester1 EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
${cleos} get accounts EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV



echo "---------------- Deploy Contract! ----------------";
${cleos} set contract 12345tester1 hostdata/debug -x 1000 -p 12345tester1



echo "---------------- debugfunc! ----------------";
${cleos} push action 12345tester1 debugfunc '["fred", "barney", 200 ]' -p 12345tester1




echo "---------------- End Docker! ----------------";
docker-compose down



