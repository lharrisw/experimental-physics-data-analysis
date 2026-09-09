# Experimental Physics Data Analysis

This repository contains MATLAB analyses, experimental data, and laboratory reports from an Advanced Physics Laboratory course.

The experiments span solar observations, radiation detection, radioactive decay, gamma-ray attenuation, scintillator calibration, and isotope identification. The computational work includes statistical analysis, uncertainty propagation, curve fitting, Monte Carlo methods, visualization, and physical-model comparison.

## Experiments

### 1. Solar Rotation

The first experiment estimated the rotation period of the Sun from observations of sunspot motion.

The analysis included:

- angular-displacement measurements;
- weighted averages;
- uncertainty propagation;
- conversion from angular velocity to an estimated rotation period.

### 2. Geiger Counter Calibration and Count Distribution

This experiment investigated the operation and calibration of a Geiger-Müller counter.

The analysis included:

- detector-response measurements as a function of operating voltage;
- comparison of radiation counts at different source-detector distances;
- investigation of inverse-distance behavior;
- analysis of radioactive counting statistics;
- comparison of measured count distributions with Gaussian approximations.

### 3. Geiger Counter Dead Time

This experiment estimated the dead time of a Geiger-Müller counter.

The computational analysis included:

- count-rate calculations;
- Poisson counting uncertainties;
- propagation of measurement uncertainty;
- comparison of dead-time estimates across detector configurations.

### 4. Attenuation Coefficients

This experiment investigated the attenuation of gamma radiation through lead and aluminum.

The analysis included:

- estimation of attenuation coefficients;
- logarithmic transformation of exponential attenuation data;
- linear fitting;
- propagation of counting uncertainties;
- Monte Carlo perturbation of measured data for parameter estimation.

The underlying attenuation law has the form

```math
I(x) = I_0 e^{-\mu x},
```

where $I_0$ is the incident intensity, $x$ is material thickness, and $\mu$ is the attenuation coefficient.

### 5. Radioactive Half-Lives

This experiment investigated the radioactive decay of silver and indium isotopes.

The analysis included:

- exponential-decay modeling;
- nonlinear least-squares fitting;
- logarithmic transformation of decay data;
- uncertainty estimation;
- estimation of radioactive half-lives.

For a first-order radioactive decay process,

```math
N(t) = N_0 e^{-\lambda t},
```

with half-life

```math
t_{1/2} = \frac{\ln 2}{\lambda}.
```

### 6. Scintillator Calibration

This experiment calibrated a scintillation detector and multichannel analyzer using known gamma-ray photopeaks.

The MATLAB analysis included:

- background subtraction;
- Gaussian fitting of gamma-ray photopeaks;
- Monte Carlo perturbation for uncertainty estimation;
- linear calibration between gamma-ray energy and detector channel number.

Reference spectra included sodium-22, cesium-137, and cobalt-60.

### 7. Isotope Identification

The final experiment applied the scintillator calibration to gamma-ray spectroscopy and isotope identification.

The analysis included:

- background subtraction;
- Gaussian photopeak fitting;
- Monte Carlo estimation of peak locations;
- analysis of silver spectra;
- investigation of unknown radioactive sources;
- analysis of naturally occurring radioactivity in a banana sample.

## Repository Structure

```text
experiments/
├── 01_solar_rotation/
├── 02_geiger_counter_calibration/
├── 03_geiger_counter_dead_time/
├── 04_attenuation_coefficients/
├── 05_radioactive_half_lives/
├── 06_scintillator_calibration/
└── 07_isotope_identification/

shared_data/
└── background.dat
```

Each experiment directory contains the MATLAB analysis, available experimental data, and the corresponding laboratory report.

## Computational Methods

Methods used across the experiments include:

- statistical analysis;
- weighted means;
- Poisson counting statistics;
- uncertainty propagation;
- nonlinear least-squares fitting;
- Gaussian peak fitting;
- Monte Carlo uncertainty estimation;
- linear regression;
- exponential-decay modeling;
- background subtraction;
- scientific visualization.

## Historical Reproducibility Notes

This repository preserves work completed during an undergraduate Advanced Physics Laboratory course. Some original acquisition files and software dependencies are no longer available.

In particular:

- some Geiger-counter datasets used in Experiment 2 are not included;
- Experiment 4 depends on a historical `Weighted_Mean_Counts` MATLAB function that is not currently present;
- the raw `.dat` files referenced by the Experiment 5 MATLAB script are not present, although saved MATLAB fitting-session files are included.

The repository should therefore be viewed as a record of the experimental analysis and computational methods used in the course rather than as a completely self-contained reproducibility package.

## Collaboration

The laboratory experiments were conducted collaboratively. Individual reports identify the collaborators involved in each experiment.

## Languages and Tools

- MATLAB
- Scientific data analysis
- Experimental physics
- Statistical modeling
- Scientific visualization

## Future Improvements

- Update file paths after repository reorganization.
- Add comments and documentation to the MATLAB analysis scripts.
- Restore missing source data where available.
- Restore or reconstruct missing helper functions where possible.
- Add selected figures from the laboratory reports to the repository README.
- Reproduce selected analyses in Python and Jupyter Notebook.
- Add clearer instructions for reproducing the experiments whose complete data remain available.

## Author

**Latimer Galvan Harris-Ward**

M.S. Mathematics  
B.S. Applied Mathematics  
B.S. Physics, Concentration in Mathematical Physics
