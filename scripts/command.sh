bash main.sh voc2007_distill rn50_voc2007 end 16 False voc2007_caption
bash main.sh coco2014_distill rn50_coco2014 end 16 False coco2014_caption
bash main.sh nuswide_distill_limit rn50_nuswide end 16 False nuswide_caption


# VOC2007
bash main_dual.sh voc2007_partial rn101 end 16 True voc2007_partial_dualcoop_448_CSC_p0_1 0.1 0
bash main_dual.sh voc2007_partial rn101 end 16 True voc2007_partial_dualcoop_448_CSC_p0_2 0.2 0
bash main_dual.sh voc2007_partial rn101 end 16 True voc2007_partial_dualcoop_448_CSC_p0_3 0.3 0


# COCO2014
bash main_dual.sh coco2014_partial rn101 end 16 True coco2014_partial_dualcoop_448_CSC_p0_1 0.1 1


# NUS-WIDE
bash main_dual.sh nuswide_partial rn101_nus end 16 True nuswide_partial_dualcoop_448_CSC_p0_1 0.1 2