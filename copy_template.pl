#!/usr/bin/perl --

use utf8;
use strict;
use Encode;
use Tkx;
use File::Copy;

# The directory of templates
my $TemplateDir = 'C:/home/etc/templates/';

my $RuntimeCharSet = 'cp932';

my $target_dir = $ARGV[0];

my $top = Tkx::widget->new(".");
$top->g_wm_withdraw();

my $template_file = Tkx::tk___getOpenFile(
	-parent => $top,
	-initialdir => "$TemplateDir",
	-title => 'Select template');
	
if($target_dir && $template_file)
{
	copy(encode($RuntimeCharSet, $template_file), $target_dir);
}

# EOF
