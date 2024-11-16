#!/usr/bin/perl -w
$^I = ".bat";
while (<>){
    if (/^#!/){
        $_ = "#!/usr/bin/perl -w\n##Copyright (C) 2024 by zxy\n";
    }
    print "$_";
}
