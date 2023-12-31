process prokka {
	container 'staphb/prokka:1.14.6'

	tag "annotating $sample"

	publishDir (
	path: "$params.out_dir",
	mode: "copy",
	overwrite: "true"
	)
	
	input:
	tuple val(sample), path(consensus_fa)

	output:
	path "04_prokka/*.gff", emit: gff

	script:
	"""
	mkdir -p 04_prokka

	prokka \
	$consensus_fa \
	--prefix $sample \
	--outdir 04_prokka \
	--force
	
	"""
}
