{"version":5,"vars":[{"line":3,"kind":2,"containerName":"","name":"strict"},{"kind":2,"name":"warnings","containerName":"","line":4},{"line":7,"containerName":"","name":"POSIX","kind":2},{"children":[{"definition":"my","kind":13,"name":"$fh","containerName":"write","line":10,"localvar":"my"},{"kind":13,"name":"$filename","containerName":"write","line":10},{"line":11,"containerName":"write","name":"$fh","kind":13},{"containerName":"write","name":"$content","kind":13,"line":11},{"line":12,"name":"$fh","containerName":"write","kind":13}],"line":9,"kind":12,"containerName":"main::","range":{"start":{"character":0,"line":9},"end":{"line":15,"character":9999}},"signature":{"parameters":[{"label":"$content"},{"label":"$filename"}],"label":"write($content,$filename)","documentation":""},"detail":"($content,$filename)","name":"write","definition":"sub"},{"children":[{"definition":"my","kind":13,"name":"$fh","containerName":"read","line":21,"localvar":"my"},{"line":21,"kind":13,"name":"$filename","containerName":"read"},{"kind":13,"containerName":"read","name":"$fh","line":23}],"line":19,"containerName":"main::","kind":12,"signature":{"documentation":"","parameters":[{"label":"$filename"}],"label":"read($filename)"},"range":{"end":{"character":9999,"line":24},"start":{"character":0,"line":19}},"detail":"($filename)","name":"read","definition":"sub"},{"kind":12,"name":"readline","line":23},{"line":27,"children":[{"line":28,"localvar":"my","definition":"my","containerName":"generate_filename","name":"$time","kind":13},{"localvar":"my","line":29,"name":"$file","containerName":"generate_filename","kind":13,"definition":"my"},{"line":29,"kind":13,"containerName":"generate_filename","name":"$time"},{"line":29,"kind":13,"name":"$seed","containerName":"generate_filename"},{"line":29,"kind":13,"containerName":"generate_filename","name":"$name"},{"definition":"my","containerName":"generate_filename","name":"$target","kind":13,"line":30,"localvar":"my"},{"name":"$dir","containerName":"generate_filename","kind":13,"line":30},{"kind":13,"containerName":"generate_filename","name":"$file","line":30},{"line":32,"kind":13,"name":"$target","containerName":"generate_filename"}],"containerName":"main::","kind":12,"detail":"($dir,$name,$seed)","range":{"start":{"line":27,"character":0},"end":{"character":9999,"line":33}},"signature":{"documentation":"","label":"generate_filename($dir,$name,$seed)","parameters":[{"label":"$dir"},{"label":"$name"},{"label":"$seed"}]},"definition":"sub","name":"generate_filename"},{"kind":12,"name":"strftime","line":28},{"name":"extract_seed","definition":"sub","range":{"start":{"character":0,"line":36},"end":{"line":44,"character":9999}},"signature":{"label":"extract_seed($file)","parameters":[{"label":"$file"}],"documentation":""},"detail":"($file)","kind":12,"containerName":"main::","children":[{"containerName":"extract_seed","name":"$PATTERN_SEED","kind":13,"definition":"my","localvar":"my","line":37},{"name":"$file","containerName":"extract_seed","kind":13,"line":39},{"line":39,"kind":13,"name":"$PATTERN_SEED","containerName":"extract_seed"}],"line":36},{"line":40,"name":"seed","kind":12}]}