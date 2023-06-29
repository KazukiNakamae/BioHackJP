# vcf_to_mplot
###################################################
pos_sample = ["SRR11561273","SRR11561298","SRR11561324"]
neg_sample = ["SRR11561289","SRR11561314","SRR11561326"]

rule all:
    input:
         expand('output/vcfdata2/vis_manhattan/positive/{p_s}_all.png',
            p_s=pos_sample
            ),
         expand('output/vcfdata2/vis_manhattan/negative/{p_s}_all.png',
            p_s=neg_sample
            )

rule vcf_to_mplot_pos:
    input:
        'data/vcfdata2/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.0.0_0.8vaf.vcf',
        'data/vcfdata2/positive/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.0.8_1.0vaf.vcf'
    output:
        'output/vcfdata2/vis_manhattan/positive/{p_s}_all.png'
    params:
        args_param_REF = 'T',
        args_param_ALT = 'C',
        args_param_col = 'orange2'
    benchmark:
        'benchmarks/output/vcfdata2/vis_manhattan/positive/{p_s}_all.txt'
    container:
        'docker://yamaken37/vcf_to_mplot:20230627'
    resources:
        mem_gb=200
    log:
        'logs/output/vcfdata2/vis_manhattan/positive/{p_s}_all.log'
    shell:
        'src/vcf_to_mplot.sh {input} {output} {params} >& {log}'
rule vcf_to_mplot_neg:
    input:
        'data/vcfdata2/negative/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.0.0_0.8vaf.vcf',
        'data/vcfdata2/negative/{p_s}.hg38.identified.snp.fltr.vaf.headerfixed.0.8_1.0vaf.vcf'
    output:
        'output/vcfdata2/vis_manhattan/negative/{p_s}_all.png'
    params:
        args_param_REF = 'T',
        args_param_ALT = 'C',
        args_param_col = 'orange2'
    benchmark:
        'benchmarks/output/vcfdata2/vis_manhattan/negative/{p_s}_all.txt'
    container:
        'docker://yamaken37/vcf_to_mplot:20230627'
    resources:
        mem_gb=200
    log:
        'logs/output/vcfdata2/vis_manhattan/negative/{p_s}_all.log'
    shell:
        'src/vcf_to_mplot.sh {input} {output} {params} >& {log}'