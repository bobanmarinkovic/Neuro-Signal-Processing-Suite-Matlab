# Bio-Signal Processing & DSP Analysis Suite

## Overview
This repository contains a specialized MATLAB framework for the acquisition, filtering, and analysis of biological signals (EEG and EMG). The suite is designed to handle the complexities of neuro-signals, focusing on noise reduction, frequency analysis, and feature extraction for BCI (Brain-Computer Interface) applications.

## Key Technical Features

### 1. Advanced Feature Extraction
- **Wavelet Analysis:** Implementation of Wavelet Transforms (`wavelet_spektrogram.m`) for time-frequency localization, allowing for precise detection of neural patterns that standard FFT might miss.
- **Spectral Visualization:** Real-time spectrograms to monitor Alpha, Beta, and Mu rhythms in EEG data.

### 2. Digital Signal Processing (DSP) Pipeline
- **Custom IIR Filter Design:** Dedicated modules for designing **Butterworth** and **Chebyshev (Type I & II)** filters.
- **Stability Analysis:** Tools for **Zero-Pole mapping** (`ZeroPolef.m`, `Zeropoleb.m`) to ensure filter stability and phase response integrity.
- **Threshold Detection:** Amplitude-based classification for EMG signals to detect muscle intent (Flexion/Extension).

### 3. Experimental Data Validation
- **Curated Datasets:** Includes several `.mat` datasets recorded during experimental sessions (`da.mat`, `ne.mat`, `test1122.mat`, `radilisad.mat`). 
- **Validation:** These datasets are used to validate filtering robustness and Wavelet-based feature extraction.

## Navigation Guide (Main Files)
Since all files are located in the root directory for easy access, here is a quick guide to the core components:

- **`main.m`** - The primary entry point for the application.
- **`EEG.m` / `EEGprozor.m`** - Core interfaces for EEG signal monitoring and analysis.
- **`EMGprozor.m`** - Interface for EMG activity and threshold detection.
- **`wavelet_spektrogram.m`** - Custom implementation of the Wavelet transform algorithm.
- **`Tipfiltra.m` / `ButteriCheby1.m`** - Modules for digital filter design and selection.
- **`ZeroPolef.m`** - Stability analysis tool for designed filters.

## Impact
This suite is optimized for researchers and engineers working on:
- **Mobile EEG Systems**
- **Prosthetic Control Algorithms** (Signal cleaning and intent recognition).
- **Clinical Neurophysiology** (Artefact removal and spectral analysis).
