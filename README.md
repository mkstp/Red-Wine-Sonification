# Red Wine sonification-visualization

This sonification represents a univariate analysis of 12 attributes of around 1500 samples of Portuguese red wines. The sonification algorithm is implemented in Sonic Pi (ruby) and a corresponding visualization is provided for Processing.

Video demo available here: 

The theoretical basis for the design comes from literature on parameter mapping strategies for sonification and auditory scene analysis of the last few decades. It also borrows concepts from contemporary theories on data visualization. 

In a nutshell, univariate distributions for each parameter of the dataset are mapped to notes along a scale spanning a single octave at varying amplitudes. Louder or more concentrated pitches heard within a cluster of tones indicate the tonal center and give an estimate of the mean of the distribution. Other characteristics of a univariate dataset can also be teased out of the sounds, including its spread (via the audibility of higher and lower tones around the centre tone), and its skew (stronger overall presence of higher or lower tones within a cluster). It is even possible to reason about the presence of outliers in the data.

Like many visualizations, this sonification is designed to be less taxing on memory in the sense that parallel attributes of information about the distribution are given at once and can remain accessible for an arbitrary amount of time. This is in contrast to many sonification designs which present data serially and therefore rely more heavily on memory to compare what came before with what comes after in a single distribution. 

Referenced available here:
