#!/usr/bin/perl -w -- 
#
# generated by wxGlade 0.6.8 (standalone edition) on Wed Jul 30 11:01:25 2014
#
# To get wxPerl visit http://wxPerl.sourceforge.net/
#

use Wx 0.15 qw[:allclasses];
use strict;
use Split::TBX;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package MyFrame;

use Wx qw[:everything];
use base qw(Wx::Frame);
use strict;
use open ":encoding(utf8)", ":std";
my ($fname, $fh, $entries, $subjectList_ref, $langList_ref, $subjectFieldList_href, $langList_href);

use Wx::Locale gettext => '_T';
sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: MyFrame::new
    $style = wxDEFAULT_FRAME_STYLE 
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    

    # Menu Bar

    $self->{splitter_win_menubar} = Wx::MenuBar->new();
    my $wxglade_tmp_menu;
    $self->{_T("file")} = Wx::Menu->new();
    $self->{_T("new")} = $self->{_T("file")}->Append(wxID_ANY, _T("New"), "");
    $self->{_T("file")}->AppendSeparator();
    $self->{_T("exit")} = $self->{_T("file")}->Append(wxID_ANY, _T("Exit"), "");
    $self->{_T("splitter_win_menubar")}->Append($self->{_T("file")}, _T("File"));
    $self->SetMenuBar($self->{splitter_win_menubar});
    
# Menu Bar end

    $self->{label_subject} = Wx::StaticText->new($self, wxID_ANY, _T("Desired Subject Field:"), wxDefaultPosition, wxDefaultSize, );
    $self->{combo_box_subjects} = Wx::ComboBox->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, [_T("---")], wxCB_DROPDOWN|wxCB_DROPDOWN|wxCB_READONLY);
    $self->{label_language} = Wx::StaticText->new($self, wxID_ANY, _T("Desired language(s):"), wxDefaultPosition, wxDefaultSize, );
    $self->{list_box_languages} = Wx::ListBox->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [], wxLB_MULTIPLE);
    $self->{button_split} = Wx::Button->new($self, wxID_ANY, _T("Split"));
    $self->{main_panel_OUT} = Wx::ScrolledWindow->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, wxSIMPLE_BORDER);
    $self->{text_ctrl_header} = Wx::TextCtrl->new($self->{main_panel_OUT}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY|wxHSCROLL|wxTE_WORDWRAP|wxNO_BORDER);
    $self->{text_ctrl_OUT} = Wx::TextCtrl->new($self->{main_panel_OUT}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY|wxHSCROLL|wxTE_RICH|wxTE_WORDWRAP|wxNO_BORDER);

    $self->__set_properties();
    $self->__do_layout();

    Wx::Event::EVT_MENU($self, $self->{_T("new")}, \&_loadFile);
    Wx::Event::EVT_MENU($self, $self->{_T("exit")}, \&_exit);
    Wx::Event::EVT_BUTTON($self, $self->{button_split}->GetId, \&_split);

    # end wxGlade
    return $self;

}


sub __set_properties {
    my $self = shift;
    # begin wxGlade: MyFrame::__set_properties
    $self->SetTitle(_T("TBX Splitter"));
    $self->SetSize(Wx::Size->new(552, 447));
    $self->{label_subject}->SetFont(Wx::Font->new(10, wxMODERN, wxNORMAL, wxBOLD, 0, "Arial"));
    $self->{combo_box_subjects}->SetMinSize(Wx::Size->new(200, 21));
    $self->{combo_box_subjects}->SetSelection(0);
    $self->{label_language}->SetMinSize(Wx::Size->new(-1, -1));
    $self->{label_language}->SetFont(Wx::Font->new(10, wxMODERN, wxNORMAL, wxBOLD, 0, "Arial"));
    $self->{list_box_languages}->SetMinSize(Wx::Size->new(200, 63));
    $self->{list_box_languages}->SetSelection(0);
    $self->{button_split}->SetMinSize(Wx::Size->new(75, 23));
    $self->{text_ctrl_header}->SetMinSize(Wx::Size->new(531, 70));
    $self->{text_ctrl_OUT}->SetMinSize(Wx::Size->new(531, 175));
    $self->{main_panel_OUT}->SetScrollRate(10, 10);
    # end wxGlade
}

sub __do_layout {
    my $self = shift;
    # begin wxGlade: MyFrame::__do_layout
    $self->{grid_sizer_parent} = Wx::FlexGridSizer->new(3, 1, 0, 0);
    $self->{sizer_bottom} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{grid_sizer_1} = Wx::FlexGridSizer->new(2, 1, 0, 0);
    $self->{sizer_OUT} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{grid_sizer_top_parent} = Wx::FlexGridSizer->new(2, 5, 0, 0);
    $self->{grid_sizer_top} = Wx::FlexGridSizer->new(2, 2, 0, 0);
    $self->{grid_sizer_parent}->Add(20, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(10, 10, 0, 0, 0);
    $self->{grid_sizer_top}->Add($self->{label_subject}, 0, wxEXPAND, 0);
    $self->{grid_sizer_top}->Add($self->{combo_box_subjects}, 0, 0, 0);
    $self->{grid_sizer_top}->Add($self->{label_language}, 0, wxEXPAND, 0);
    $self->{grid_sizer_top}->Add($self->{list_box_languages}, 0, wxALL|wxEXPAND, 0);
    $self->{grid_sizer_top}->AddGrowableRow(2);
    $self->{grid_sizer_top}->AddGrowableCol(2);
    $self->{grid_sizer_top_parent}->Add($self->{grid_sizer_top}, 1, wxEXPAND, 0);
    $self->{grid_sizer_top_parent}->Add(20, 20, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add($self->{button_split}, 0, wxEXPAND|wxALIGN_RIGHT|wxFIXED_MINSIZE, 0);
    $self->{grid_sizer_top_parent}->Add(10, 20, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(10, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(20, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(20, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(20, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->Add(10, 10, 0, 0, 0);
    $self->{grid_sizer_top_parent}->AddGrowableCol(3);
    $self->{grid_sizer_parent}->Add($self->{grid_sizer_top_parent}, 1, wxEXPAND, 0);
    $self->{grid_sizer_1}->Add($self->{text_ctrl_header}, 0, wxEXPAND|wxFIXED_MINSIZE, 0);
    $self->{sizer_OUT}->Add($self->{text_ctrl_OUT}, 1, wxEXPAND|wxFIXED_MINSIZE, 0);
    $self->{grid_sizer_1}->Add($self->{sizer_OUT}, 1, wxEXPAND, 0);
    $self->{main_panel_OUT}->SetSizer($self->{grid_sizer_1});
    $self->{grid_sizer_1}->AddGrowableRow(0);
    $self->{grid_sizer_1}->AddGrowableRow(1);
    $self->{grid_sizer_1}->AddGrowableCol(0);
    $self->{sizer_bottom}->Add($self->{main_panel_OUT}, 1, wxEXPAND, 0);
    $self->{grid_sizer_parent}->Add($self->{sizer_bottom}, 1, wxEXPAND, 0);
    $self->SetSizer($self->{grid_sizer_parent});
    $self->{grid_sizer_parent}->AddGrowableRow(2);
    $self->{grid_sizer_parent}->AddGrowableCol(0);
    $self->Layout();
    # end wxGlade
}

sub _exit {
    my ($self, $event) = @_;
	# wxGlade: MyFrame::_exit <event_handler>
	
	$self->Destroy();
    $event->Skip;
    # end wxGlade
}

sub _loadFile {
    my ( $self, $event ) = @_;
	# wxGlade: MyFrame::_loadFile <event_handler>
    # Open a filedialog where a file can be opened
    my $filedlg = Wx::FileDialog->new(  $self,         # parent
                                        'Open File',   # Caption
                                        '',            # Default directory
                                        '',            # Default file
                                        "TBX Glossaries (*.tbx)|*.tbx", # wildcard
                                        wxFD_OPEN);        # style
    # If the user really selected one
    if ($filedlg->ShowModal==wxID_OK)
    {
        my $filename = $filedlg->GetPath;
        # do something useful
		
		##Clear previous session##
		$self->{text_ctrl_OUT}->Remove(0, -1);
		$self->{text_ctrl_header}->Remove(0, -1);
		$self->{text_ctrl_header}->AppendText("***Please note that the Splitter must be reopened to open a new glossary.***\n");
		$self->{_T("new")}->Enable(0);  #disables "new" option because window cannot be properly refreshed between uses dynamically
		# $self->{text_ctrl_header}->AppendText($filename);
		# $self->{combo_box_subjects}->Clear();
		# $self->{combo_box_subjects}->Append("---");
		# $self->{combo_box_subjects}->SetValue("---");
		
		# $self->{list_box_languages}->Clear();  ##cannot get this to work##
		##End Clear
		
		
		($fname, $fh, $entries, $subjectList_ref, $langList_ref, $subjectFieldList_href, $langList_href) = Split::TBX->scan($filename, $self);
		$self->{text_ctrl_header}->AppendText("\n\nScanning has completed!! Select language(s) and/or subject to split.\n");
		
		foreach (@{$subjectList_ref})
		{
			$self->{combo_box_subjects}->Append("$_");
		}
		
		foreach (@{$langList_ref})
		{
			$self->{list_box_languages}->Append("$_");
		}
    }
	$event->Skip; ##this causes the file browser to open twice for some reason?
	# end wxGlade
}


sub _split {
    my ($self, $event) = @_;
    # wxGlade: MyFrame::_split <event_handler>
	my $fhout;
	my $fileName;
	my $Type;
	my %outTypes;
	@{$outTypes{language}} = ();
	# GLOBALS ($fname, $fh, $entries);
	
	my $subject = $self->{combo_box_subjects}->GetValue;
	my @langs = $self->{list_box_languages}->GetSelections;
	
	if ($subject ne "---" && @langs > 0)
	{

		$fileName = $fname."_subjectField(".lc($self->{combo_box_subjects}->GetValue).")_language(";
		$outTypes{subjectField} = lc($subject);
		my $x = 0;
		foreach (@langs)
		{
			push (@{$outTypes{language}}, lc(@{$langList_ref}[$_]));
			
			$x++;
			if ($x == 1)
			{
				$fileName .= "@{$langList_ref}[$_]";
			}
			else { $fileName .= "-@{$langList_ref}[$_]"}
		}
		$fileName .= ").tbx";
		$Type = "both";
	}
	elsif ($subject ne "---")
	{

		$fileName = $fname."_subjectField(".lc($subject).").tbx";
		$outTypes{subjectField} = lc($subject);
		$Type = "subjectField";
	}
	elsif (@langs > 0)
	{

		$fileName = $fname."_language(";
		my $x = 0;
		foreach (@langs)
		{
			push (@{$outTypes{language}}, lc(@{$langList_ref}[$_]));
			
			$x++;
			if ($x == 1)
			{
				$fileName .= "@{$langList_ref}[$_]";
			}
			else { $fileName .= "-@{$langList_ref}[$_]"}
		}
		$fileName .= ").tbx";
		$Type = "language";
	}
	
	open $fhout, ">", $fileName;
    if (Split::TBX->split($fh, $Type, \%outTypes, $fhout, $entries, $subjectFieldList_href, $langList_href, $self))
	{
		$self->{text_ctrl_header}->AppendText("\nPrinted successfully to:\n $fileName!");
	}
	close $fhout;
    $event->Skip;
    # end wxGlade
}

# end of class MyFrame

1;

package MyApp;

use base qw(Wx::App);
use strict;

sub OnInit {
    my( $self ) = shift;

    Wx::InitAllImageHandlers();

    my $splitter_win = MyFrame->new();

    $self->SetTopWindow($splitter_win);
    $splitter_win->Show(1);

    return 1;
}
# end of class MyApp

package main;

&_run unless(caller);

sub _run {
    my $local = Wx::Locale->new("English"); # replace with ??
    $local->AddCatalog("tbx_splitter"); # replace with the appropriate catalog name

    my $tbx_splitter = MyApp->new();
    $tbx_splitter->MainLoop();
}
