use utf8;
use strict;
use Encode;
use Tkx;
use File::Copy;
use File::Basename;

# The directory of templates
my $TemplateDir = 'C:/home/etc/templates/';

# Default encoding of Windows
my $RuntimeCharSet = 'cp932';

my $target_dir = $ARGV[0];

my $top = Tkx::widget->new(".");
$top->g_wm_withdraw();

my $selected_file_list = Tkx::tk___getOpenFile(
	-parent => $top,
	-initialdir => "$TemplateDir",
	-title => 'Select template',
	-multiple => 1);


if($target_dir && $selected_file_list)
{
	my ($sec, $min, $hour, $mday, $month, $year) = localtime(time);
	$year += 1900;
	($month, $mday, $hour, $min, $sec) = map{ sprintf("%02d", $_); }
		(($month + 1), $mday, $hour, $min, $sec);

	my @template_files = Tkx::SplitList($selected_file_list);

	
	for my $template_file (@template_files)
	{
		# replace parameters in file name with actual values
		my $target_file = basename($template_file);
		$target_file =~ s/%Y/$year/g;
		$target_file =~ s/%M/$month/g;
		$target_file =~ s/%D/$mday/g;
		$target_file =~ s/%h/$hour/g;
		$target_file =~ s/%m/$min/g;
		$target_file =~ s/%s/$sec/g;
		
		my $target_path = $target_dir . "/" . encode($RuntimeCharSet, $target_file);

		if(-e $target_path)
		{
			Tkx::tk___messageBox(
				-parent => $top,
				-icon => "warning",
				-title => "Failed",
				-message => "$target_file already exists.");
		}
		else
		{
			copy(encode($RuntimeCharSet, $template_file), $target_path);
		}
	}
}

# EOF
