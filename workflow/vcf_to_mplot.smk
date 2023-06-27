# vcf_to_mplot
###################################################
pos_sample = ["SRR11561273","SRR11561298","SRR11561324"]
neg_sample = ["SRR11561289","SRR11561314","SRR11561326"]
vaf_range = ["0.0_0.8","0.8_1.0"]

rule all:
    input:
         expand('output/vcfdata2/vis_manhattan/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.png',
            p_s=pos_sample,
            v_r=vaf_range
            ),
         expand('output/vcfdata2/vis_manhattan/negative/{n_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.png',
            n_s=neg_sample,
            v_r=vaf_range
            ),

rule vcf_to_mplot_pos:
    input:
        'data/vcfdata2/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf'
    output:
        'output/vcfdata2/vis_manhattan/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.png'
    params:
        args_param_REF = 'T',
        args_param_ALT = 'C'
    benchmark:
        'benchmarks/output/vcfdata2/vis_manhattan/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.txt'
    container:
        'docker://yamaken37/vcf_to_mplot:20230627'
    resources:
        mem_gb=200
    log:
        'logs/output/vcfdata2/vis_manhattan/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.log'
    shell:
        'src/vcf_to_mplot.sh {input} {output} {params} >& {log}'

rule vcf_to_mplot_neg:
    input:
        'data/vcfdata2/negative/{n_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf'
    output:
        'output/vcfdata2/vis_manhattan/negative/{n_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.png'
    params:
        args_param_REF = 'T',
        args_param_ALT = 'C'
    benchmark:
        'benchmarks/output/vcfdata2/vis_manhattan/negative/{n_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.txt'
    container:
        'docker://yamaken37/vcf_to_mplot:20230627'
    resources:
        mem_gb=200
    log:
        'logs/output/vcfdata2/vis_manhattan/negative/{n_s}.hg38.identified.snp.fltr.vaf.headerfixed.{v_r}vaf.vcf.log'
    shell:
        'src/vcf_to_mplot.sh {input} {output} {params} >& {log}'