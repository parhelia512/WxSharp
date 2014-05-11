enum wxEllipsizeFlags
{
    wxELLIPSIZE_FLAGS_NONE = 0,
    wxELLIPSIZE_FLAGS_PROCESS_MNEMONICS = 1,
    wxELLIPSIZE_FLAGS_EXPAND_TABS = 2,
    wxELLIPSIZE_FLAGS_DEFAULT = wxELLIPSIZE_FLAGS_PROCESS_MNEMONICS|wxELLIPSIZE_FLAGS_EXPAND_TABS
};

enum wxEllipsizeMode
{
    wxELLIPSIZE_NONE,
    wxELLIPSIZE_START,
    wxELLIPSIZE_MIDDLE,
    wxELLIPSIZE_END
};

class wxControl : public wxWindow
{
public:
   wxControl(wxWindow *parent, wxWindowID id,
             const wxPoint& pos = wxDefaultPosition,
             const wxSize& size = wxDefaultSize, long style = 0,
             const wxValidator& validator = wxDefaultValidator,
             const wxString& name = wxControlNameStr);

    wxControl();
    
    bool Create(wxWindow *parent, wxWindowID id,
            const wxPoint& pos = wxDefaultPosition,
            const wxSize& size = wxDefaultSize, long style = 0,
            const wxValidator& validator = wxDefaultValidator,
            const wxString& name = wxControlNameStr);

    /* TODO virtual void Command(wxCommandEvent& event); */

    wxString GetLabel() const;
    wxString GetLabelText() const;
    wxSize GetSizeFromTextSize(int xlen, int ylen = -1) const;
    wxSize GetSizeFromTextSize(const wxSize& tsize) const;
    void SetLabel(const wxString& label);
    void SetLabelText(const wxString& text);
    bool SetLabelMarkup(const wxString& markup);

public:     // static functions
    
    static wxString GetLabelText(const wxString& label);
    static wxString RemoveMnemonics(const wxString& str);
    static wxString EscapeMnemonics(const wxString& text);
    /* TODO  wxDC
    static wxString Ellipsize(const wxString& label, const wxDC& dc, wxEllipsizeMode mode, int maxWidth, int flags = wxELLIPSIZE_FLAGS_DEFAULT);
    */
};

