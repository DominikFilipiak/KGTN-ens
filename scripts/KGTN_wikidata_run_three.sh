GPU_ID=$1
GGNN_COEF=$2

./scripts/KGTN_wikidata_CosSim.sh $1 $2
./scripts/KGTN_wikidata_InnerProduct.sh $1 $2
./scripts/KGTN_wikidata_PearCorr.sh $1 $2
