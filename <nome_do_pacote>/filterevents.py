
import sys,getopt

def main(argv):
    inputfile = 'log'
    wordtofilter='Logging event (FE)'
    try:
        opts, args = getopt.getopt(argv,"hi:f:",["ifile=","filter="])
    except getopt.GetoptError:
        print('filterevents.py -i <inputfile> -f <filterstring>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('filterevents.py -i <inputfile> -f <filterstring>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-f", "--filter"):
            wordtofilter = arg
    
    outputfile = inputfile+'_events'
    inputfile,outputfile=inputfile+'.txt',outputfile+'.txt'
    print('Filtrando linhas com '+wordtofilter+' do arquivo '+inputfile+' para '+outputfile)
    open(outputfile,'w').writelines(line for line in open(inputfile) if wordtofilter in line)

if __name__ == "__main__":
   main(sys.argv[1:])

