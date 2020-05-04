## Significance of the excess lags

Rather large discrepancies occurred between
    range data from USSTRATCOM's SSN radars
and
    NASA's Doppler-integrated range
during NEAR's Earth flyby on 23rd January 1998 
    [1].
Similar discrepancies with radar
    were subsequently found
        for Galileo.
These radar residuals
    have not been further considered by JPL,
though
    discrepancies between
        the pre- and post-encounter trajectory segements
have been investigated
    as the _flyby anomaly_
    [2].
NEAR's radar residuals were shown in
    [3]
to not only closely fit
    the instantaneous range as _range lags_
        _&Delta;r=-v.&Delta;t_,
where
    _v_ is the spacecraft's range range
        and _&Delta;t_, the one-way light time,
but also explain
    NEAR's velocity anomaly
as the corresponding _velocity lags_
    _&Delta;v=-a.&Delta;t_,
where
    _a_ denotes the instantaneous radial acceleration.
These lags are in _excess_,
    since one way travel delays
        _&Delta;t&equiv;r/c_
    are already corrected for in computing
        the spacecraft velocity and acceleration
    from the received signal.


The implication that
    the telemetry Doppler had range proportional shifts
        is fundamentally problematic for current physics,
as it means that
    the shifts can result simply from wave propagation
        at the extremely short range of Earth orbits,
and thus with no dependence on
    an expanding space-time metric
        as currently required for
            the cosmological shifts. 
The only other velocity variable available
    for interpreting these range errors
        in terms of time
    is the speed of light _c_,
i.e.,
    as _&Delta;r=-c.&Delta;t_.
That makes it
    the only alternative explanation
        at all allowed by the context,
but it would entail
    a difference in speeds between
        radar and telemetry signals,
    violating relativity,
and
not explain how
    this difference is peculiar to
        NEAR's flyby
    and absent in Juno's,
        which was at almost the same altitude
    [4].
The excess lags are thus
    the only possible explanation,
and are implied by
    the carrier phase lock condition at the transponder
        as a chirp spectral mode
    [3].
The specificity to older spacecrafts
    including Galileo, NEAR and Rosetta
correlates with
    a substantial change in
        the transponder carrier loop design
    after Cassini
    [5].


Coupling to the Earth's magnetic field
    has been hypothesized
to reconcile
    the absence of the anomaly in later flybys
        with a frame-dragging explanation for the anomalies,
but there is no way to reconcile
    the radar residuals with any such space-time mechanism
    [6].
In hindsight,
the traditional notion of _translational symmetry_ of waves
    against range proportional shifts
is specific to
    sinusoidal eigenfunctions
        and therefore to Fourier spectra.
The standard deviation S = 126.59 m
    and mean square error R = 654.153 m
        &equiv; 5.1675 S
    (see JPL's own annotation at the top of
        the [residuals figure](https://github.com/earthshrink/flyby-analysis/blob/gh-pages/near/fig_near_ssn.pdf))
makes NEAR's radar residuals already a 5&sigma; dataset
    against translational symmetry of waves being
        a law of nature.
The practical significance of
    the chirp modes
for communication, radar and imaging technologies
    had been previously explored
    IEEE WCNC and [MILCOM 2005](https://arXiv.org/abs/0812.2652),
    and [SPIE 2008](https://arXiv.org/abs/0812.1004)
    conference papers.


### References

[1] P G Antreasian and J R Guinn,
_Investigations into the unexpected Delta-V increases during the earth gravity assists of Galileo and NEAR_,
AIAA, 98-4287 (1998) 

[2] J D Anderson, J K Campbell, J E Ekelund, J Ellis and J F Jordan,
_Anomalous Orbital-Energy Changes Observed during Spacecraft Flybys of Earth_,
PRL, 100, 9, 091102 (2008);
J D Anderson and M M Nieto,
_Astrometric Solar-System Anomalies_,
Proc IAU Symp No. 261 (2009)
[arXiv:0907.2469v2](https://arXiv.org/abs/0907.2469)

[3] V Guruprasad,
_Observational evidence for travelling wave modes bearing distance proportional shifts_,
[arXiv:1507.08222](https://arXiv.org/abs/1507.08222),
EPL, 110, 5,
[54001](http://stacks.iop.org/0295-5075/110/i=5/a=54001)
(2015) 

<!--
See also:
L Bilbao,
_Comment on Observational evidence for travelling wave modes bearing distance proportional shifts_,
[EPL](https://iopscience.iop.org/article/10.1209/0295-5075/115/54004) (2016),
Also: _Does the velocity of light depend on the source movement?_,
Prog in Phys (12) 307-312
[arXiv:1606.03921](https://arXiv.org/abs/1606.03921)
(2016)
-->

[4]
P F Thompson, M Abrahamson, S Ardalan and J Bordi,
_Reconstruction of the Earth flyby by the Juno spacecraft_,
AAS, 14-435 (2014) 

[5] V Guruprasad,
_Conclusive analysis and cause of the flyby anomaly_,
Presented at [IEEE NAECON 2019](https://attend.ieee.org/naecon-2019/wp-content/uploads/sites/29/2019/08/Guruprasad-483-Radar-2.pdf). ([Proceedings preprint](https://doi.org/10.36227/techrxiv.10252871))

[6]
B M Mirza,
_The Flyby Anomaly and the Gravitational-Magnetic Field Induced Frame-Dragging Effect around the Earth_,
MNRAS, 489, 3, 3232-3235, [arXiv:1909.08083](https://arXiv.org/abs/1909.08083) (2019) 
Also:
V Guruprasad, _Comment on "The Flyby Anomaly and the Gravitational-Magnetic Field Induced Frame-Dragging Effect around the Earth"_,
[arXiv:1911.05453](https://arXiv.org/abs/1911.05453) (2019) 

---

