# This is the repository for the Juechems, Balaguer, Ruz, & Summerfield (2017) paper

You can run the task by simply changing to this root directory and running 
start_experiment. 

If you want to perform other computations, cd to this directory, run addcode,
and get started.

The files in scripts handle the main computations.

paper_behaviour.m will run the logistic regression and a few descriptives. 
paper_last_outcome.m recreates the data (not the figure) for figure 1c.
paper_model_estimation.m handles the estimation of prospect theory models. 
Note that this may take a long time to run and please also read the comments
within the file as a note of caution. 

The simulation can be run with simulate_PT_compare, where the first block of
code specifies the iterations (how many blocks of 75 trials) the number (or values)
of update parameter to be used, and the parameters (here set to an optimal EV-maximizing agent)
to be used. This can be quite computationally intensive, so expect long running
times for settings of large n_iter and/or large n_delta.

If you have any questions, remarks, or spotted any errors, please contact
keno.juchems@psy.ox.ac.uk