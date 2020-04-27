wordtofilter,inputfile='Logging event (FE)','log'
open(inputfile+'_events.txt','w').writelines(line for line in open(inputfile+'.txt') if wordtofilter in line)
