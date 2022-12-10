# Analysis of excess lags in Earth flyby tracks

The code repository
	[flyby-analysis](https://github.com/earthshrink/flyby-analysis)
contains a collection of
	scripts, queries, LaTeX sources and
	selected figure PDFs from NASA and ESA papers on the `flyby anomaly`
that generate
	the following PDF graphs
presented at
    [NAECON 2019](https://attend.ieee.org/naecon-2019/post-conference-info/)
and included in the
    [final paper](https://ieeexplore.ieee.org/document/9057993)
    ([preprint](https://doi.org/10.36227/techrxiv.10252871) with minor fixes),
with further updates on the last (SSN residuals):

 - [fig_galileo_doppler_acceleration.pdf](galileo/fig_galileo_doppler_acceleration.pdf)
 - [fig_galileo_doppler_velocity.pdf](galileo/fig_galileo_doppler_velocity.pdf)
 - [fig_galileo_lags.pdf](galileo/fig_galileo_lags.pdf)
 - [fig_near_canberra.pdf](near/fig_near_canberra.pdf)
 - [fig_near_goldstone.pdf](near/fig_near_goldstone.pdf)
 - [fig_rosetta2005_goldstone.pdf](rosetta/fig_rosetta2005_goldstone.pdf)
 - [fig_rosetta2005_newnorcia.pdf](rosetta/fig_rosetta2005_newnorcia.pdf)
 - [fig_rosetta2007_goldstone.pdf](rosetta/fig_rosetta2007_goldstone.pdf)
 - [fig_rosetta2007_newnorcia.pdf](rosetta/fig_rosetta2007_newnorcia.pdf)
 - [fig_rosetta2009_maspalomas.pdf](rosetta/fig_rosetta2009_maspalomas.pdf)
 - [fig_rosetta2009_newnorcia.pdf](rosetta/fig_rosetta2009_newnorcia.pdf)
 - [fig_near_ssn.pdf](near/fig_near_ssn.pdf)
    - the initial 6 Millstone points marked as outliers (likely from other objects in radar view)
    - the overlap of DSN Goldstone tracking is highlighted

The fundamental significance of the lags revealed by these graphs is explained
	[here](https://github.com/earthshrink/flyby-analysis/blob/master/About.md).


## 2022 update

### Residual oscillations are reproduced by simulation

See [anomaly-sim](https://github.com/earthshrink/anomaly-sim)


### Phase shift in post-encounter Doppler

A phase shift has been found between JPL's AIAA 1998 and PRL 2008 analyses
of NEAR's post-encounter Doppler residual oscillations, similar to one found
in the simulation.

Compare
 - [fig_near_canberra.pdf](near/fig_near_canberra.pdf)
 - [fig_near_canberra_overprl.pdf](near/fig_near_canberra_overprl.pdf)


