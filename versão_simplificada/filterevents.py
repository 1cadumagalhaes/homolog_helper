wordtofilter,inputfile='Logging event (FE)','purchases'
open(inputfile+'_events.txt','w').writelines(line for line in open(inputfile+'.txt') if wordtofilter in line)