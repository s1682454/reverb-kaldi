#!/bin/bash

. check.sh


export TR_MDL="mono tri1 gmm gmm_lda gmm_sat gmm_mc gmm_sat_mc gmm_lda_mc gmm_lda_sat gmm_lda_sat_mc"
export DT_MDL=${TR_MDL}
export REG="dt"

for feat in  bnf ; do
    export FEAT_TYPE=$feat
    utils/call.sh \
        local/TrainAMs.sh
    # decode all development sets
    utils/call.sh \
        local/DecodeDTs.sh normal fmllr

    utils/call.sh \
        local/WerDTs.sh
done
