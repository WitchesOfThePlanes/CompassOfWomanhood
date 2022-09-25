set FILES
for fi in (ls 6WSHIT0*.wav 6WSHIT1*.wav 6WSHIT2*.wav 6WSHIT3*.wav 6WSHIT4*.wav)
  set FILES $FILES $fi ../../pl_PL/sounds/$fi silence.wav
end
sox $FILES comparison.wav
