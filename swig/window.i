enum wxShowEffect
{
    wxSHOW_EFFECT_NONE,
    wxSHOW_EFFECT_ROLL_TO_LEFT,
    wxSHOW_EFFECT_ROLL_TO_RIGHT,
    wxSHOW_EFFECT_ROLL_TO_TOP,
    wxSHOW_EFFECT_ROLL_TO_BOTTOM,
    wxSHOW_EFFECT_SLIDE_TO_LEFT,
    wxSHOW_EFFECT_SLIDE_TO_RIGHT,
    wxSHOW_EFFECT_SLIDE_TO_TOP,
    wxSHOW_EFFECT_SLIDE_TO_BOTTOM,
    wxSHOW_EFFECT_BLEND,
    wxSHOW_EFFECT_EXPAND,
    wxSHOW_EFFECT_MAX
};


enum
{
    wxSEND_EVENT_POST = 1
};

/* TODO attributes
struct  wxVisualAttributes
{
    wxFont font;
    wxColour colFg;
    wxColour colBg;
};
*/

enum wxWindowVariant
{
    wxWINDOW_VARIANT_NORMAL,  //!< Normal size
    wxWINDOW_VARIANT_SMALL,   //!< Smaller size (about 25 % smaller than normal)
    wxWINDOW_VARIANT_MINI,    //!< Mini size (about 33 % smaller than normal)
    wxWINDOW_VARIANT_LARGE,   //!< Large size (about 25 % larger than normal)
    wxWINDOW_VARIANT_MAX
};

class wxWindow : public wxEvtHandler
{
public:
    wxWindow(wxWindow* parent, wxWindowID id,
             const wxPoint& pos = wxDefaultPosition,
             const wxSize& size = wxDefaultSize,
             long style = 0,
             const wxString& name = wxPanelNameStr);
    virtual ~wxWindow();

    virtual bool AcceptsFocus() const;
    virtual bool AcceptsFocusFromKeyboard() const;
    virtual bool AcceptsFocusRecursively() const;
    
    bool IsFocusable() const;
    bool CanAcceptFocus() const;
    bool CanAcceptFocusFromKeyboard() const;
    
    virtual bool HasFocus() const;
    virtual void SetCanFocus(bool canFocus);
    virtual void SetFocus();
    virtual void SetFocusFromKbd();
    
    virtual void AddChild(wxWindow* child);
    bool DestroyChildren();

    wxWindow* FindWindow(long id) const;
    wxWindow* FindWindow(const wxString& name) const;

    /* TODO wxWindowList& GetChildren(); */
    /* TODO const wxWindowList& GetChildren() const; */
    virtual void RemoveChild(wxWindow* child);

    wxWindow* GetGrandParent() const;
    wxWindow* GetNextSibling() const;
    wxWindow* GetParent() const;
    wxWindow* GetPrevSibling() const;

    /* TODO bool IsDescendant(wxWindowBase* win) const; */
    virtual bool Reparent(wxWindow* newParent);


    virtual void AlwaysShowScrollbars(bool hflag = true, bool vflag = true);
    virtual int GetScrollPos(int orientation) const;
    virtual int GetScrollRange(int orientation) const;
    virtual int GetScrollThumb(int orientation) const;
    
    bool CanScroll(int orient) const;
    bool HasScrollbar(int orient) const;
    
    virtual bool IsScrollbarAlwaysShown(int orient) const;
    virtual bool ScrollLines(int lines);
    virtual bool ScrollPages(int pages);
    virtual void ScrollWindow(int dx, int dy,
                              const wxRect* rect = NULL);

    bool LineUp();
    bool LineDown();
    bool PageUp();
    bool PageDown();

    virtual void SetScrollPos(int orientation, int pos,
                              bool refresh = true);
    virtual void SetScrollbar(int orientation, int position,
                              int thumbSize, int range,
                              bool refresh = true);

    class ChildrenRepositioningGuard
    {
    public:
        explicit ChildrenRepositioningGuard(wxWindow* win);
        ~ChildrenRepositioningGuard();
    };

    bool BeginRepositioningChildren();
    void EndRepositioningChildren();
    
    void CacheBestSize(const wxSize& size) const;

    virtual wxSize ClientToWindowSize(const wxSize& size) const;
    virtual wxSize WindowToClientSize(const wxSize& size) const;
    
    virtual void Fit();
    virtual void FitInside();
    wxSize GetBestSize() const;

    int GetBestHeight(int width) const;
    int GetBestWidth(int height) const;

    wxSize GetClientSize() const;

    virtual wxSize GetEffectiveMinSize() const;
    virtual wxSize GetMaxClientSize() const;
    virtual wxSize GetMaxSize() const;
    virtual wxSize GetMinClientSize() const;
    virtual wxSize GetMinSize() const;
    int GetMinWidth() const;
    int GetMinHeight() const;
    int GetMaxWidth() const;
    int GetMaxHeight() const;

    wxSize GetSize() const;
    wxSize GetVirtualSize() const;

    virtual wxSize GetBestVirtualSize() const;
    virtual double GetContentScaleFactor() const;
    virtual wxSize GetWindowBorderSize() const;
    
    virtual bool
    InformFirstDirection(int direction,
                         int size,
                         int availableOtherDir);
    
    void InvalidateBestSize();
    void PostSizeEvent();
    void PostSizeEventToParent();

    virtual void SendSizeEvent(int flags = 0);
    void SendSizeEventToParent(int flags = 0);
    void SetClientSize(int width, int height);
    void SetClientSize(const wxSize& size);
    void SetClientSize(const wxRect& rect);

    /* TODO void SetContainingSizer(wxSizer* sizer); */
    void SetInitialSize(const wxSize& size = wxDefaultSize);
    virtual void SetMaxClientSize(const wxSize& size);
    virtual void SetMaxSize(const wxSize& size);
    virtual void SetMinClientSize(const wxSize& size);
    virtual void SetMinSize(const wxSize& size);
    void SetSize(int x, int y, int width, int height, int sizeFlags = wxSIZE_AUTO);
    void SetSize(const wxRect& rect);
    void SetSize(const wxSize& size);
    void SetSize(int width, int height);

    virtual void SetSizeHints( const wxSize& minSize, const wxSize& maxSize=wxDefaultSize, const wxSize& incSize=wxDefaultSize);
    virtual void SetSizeHints( int minW, int minH, int maxW = -1, int maxH = -1, int incW = -1, int incH = -1 );
    void SetVirtualSize(int width, int height);
    void SetVirtualSize(const wxSize& size);
    
    void Center(int dir = wxBOTH);
    void CenterOnParent(int dir = wxBOTH);
    void Centre(int direction = wxBOTH);
    void CentreOnParent(int direction = wxBOTH);
    
    wxPoint GetPosition() const;
    wxRect GetRect() const;
    wxPoint GetScreenPosition() const;
    wxRect GetScreenRect() const;
    virtual wxPoint GetClientAreaOrigin() const;
    wxRect GetClientRect() const;

    void Move(int x, int y, int flags = wxSIZE_USE_EXISTING);
    void Move(const wxPoint& pt, int flags = wxSIZE_USE_EXISTING);
    void SetPosition(const wxPoint& pt);

    /**
        @name Coordinate conversion functions
    */
    //@{

    wxPoint ClientToScreen(const wxPoint& pt) const;
    wxPoint ConvertDialogToPixels(const wxPoint& pt) const;
    wxSize ConvertDialogToPixels(const wxSize& sz) const;
    wxPoint ConvertPixelsToDialog(const wxPoint& pt) const;
    wxSize ConvertPixelsToDialog(const wxSize& sz) const;
    wxPoint ScreenToClient(const wxPoint& pt) const;
    
    /**
        @name Drawing-related functions
    */
    //@{

    virtual void ClearBackground();
    void Freeze();
    void Thaw();
    bool IsFrozen() const;

    /* TODO attributes
    wxColour GetBackgroundColour() const;
    virtual wxBackgroundStyle GetBackgroundStyle() const;
    virtual int GetCharHeight() const;
    virtual int GetCharWidth() const;
    virtual wxVisualAttributes GetDefaultAttributes() const;
    wxFont GetFont() const;
    wxColour GetForegroundColour() const;
    void GetTextExtent(const wxString& string,
                       int* w, int* h,
                       int* descent = NULL,
                       int* externalLeading = NULL,
                       const wxFont* font = NULL) const;
    
    wxSize GetTextExtent(const wxString& string) const;
    */

    const wxRegion& GetUpdateRegion() const;
    wxRect GetUpdateClientRect() const;
    
    virtual bool HasTransparentBackground();
    virtual void Refresh(bool eraseBackground = true, const wxRect* rect = NULL);
    void RefreshRect(const wxRect& rect, bool eraseBackground = true);
    
    virtual void Update();
   
    /* TODO
    virtual bool SetBackgroundColour(const wxColour& colour);
    virtual bool SetBackgroundStyle(wxBackgroundStyle style);
    */

    virtual bool IsTransparentBackgroundSupported(wxString *reason = NULL) const;

    /* TODO
    virtual bool SetFont(const wxFont& font);
    virtual bool SetForegroundColour(const wxColour& colour);
    void SetOwnBackgroundColour(const wxColour& colour);
    bool InheritsBackgroundColour() const;
    bool UseBgCol() const;
    void SetOwnFont(const wxFont& font);
    void SetOwnForegroundColour(const wxColour& colour);
    void SetPalette(const wxPalette& pal);
    virtual bool ShouldInheritColours() const;
    virtual void SetThemeEnabled(bool enable);
    virtual bool GetThemeEnabled() const;
    virtual bool CanSetTransparent();
    virtual bool SetTransparent(wxByte alpha);
    */


    /* TODO events
    wxEvtHandler* GetEventHandler() const;
    bool HandleAsNavigationKey(const wxKeyEvent& event);
    bool HandleWindowEvent(wxEvent& event) const;
    bool ProcessWindowEvent(wxEvent& event);
    bool ProcessWindowEventLocally(wxEvent& event);
    wxEvtHandler* PopEventHandler(bool deleteHandler = false);
    void PushEventHandler(wxEvtHandler* handler);
    bool RemoveEventHandler(wxEvtHandler* handler);
    void SetEventHandler(wxEvtHandler* handler);
    virtual void SetNextHandler(wxEvtHandler* handler);
    virtual void SetPreviousHandler(wxEvtHandler* handler);
    */

    /**
        @name Window styles functions
    */
    long GetExtraStyle() const;
    virtual long GetWindowStyleFlag() const;
    long GetWindowStyle() const;
    bool HasExtraStyle(int exFlag) const;
    bool HasFlag(int flag) const;
    virtual void SetExtraStyle(long exStyle);
    virtual void SetWindowStyleFlag(long style);
    void SetWindowStyle(long style);
    bool ToggleWindowStyle(int flag);


    /**
        @name Tab order functions
    */
    void MoveAfterInTabOrder(wxWindow* win);
    void MoveBeforeInTabOrder(wxWindow* win);

    /* TODO events
    bool Navigate(int flags = wxNavigationKeyEvent::IsForward);
    bool NavigateIn(int flags = wxNavigationKeyEvent::IsForward);
    */


    /**
        @name Z order functions
    */
    virtual void Lower();
    virtual void Raise();

    bool Hide();
    virtual bool HideWithEffect(wxShowEffect effect, unsigned int timeout = 0);
    bool IsEnabled() const;
    bool IsExposed(int x, int y) const;
    bool IsExposed(wxPoint& pt) const;
    bool IsExposed(int x, int y, int w, int h) const;
    bool IsExposed(wxRect& rect) const;
    virtual bool IsShown() const;
    virtual bool IsShownOnScreen() const;
    bool Disable();
    virtual bool Enable(bool enable = true);
    virtual bool Show(bool show = true);
    virtual bool ShowWithEffect(wxShowEffect effect, unsigned int timeout = 0);

    /* TODO help
    wxString GetHelpText() const;
    void SetHelpText(const wxString& helpText);
    virtual wxString GetHelpTextAtPoint(const wxPoint& point, wxHelpEvent::Origin origin) const;
    */

    /* TODO wxToolTip* GetToolTip() const; */

    wxString GetToolTipText() const;
    void SetToolTip(const wxString& tipString);

    /* TODO wxToolTip
    void SetToolTip(wxToolTip* tip);
    void UnsetToolTip();
    */


    /* TODO popup menus
    int GetPopupMenuSelectionFromUser(wxMenu& menu,
                                      const wxPoint& pos = wxDefaultPosition);
    int GetPopupMenuSelectionFromUser(wxMenu& menu, int x, int y);
    bool PopupMenu(wxMenu* menu, const wxPoint& pos = wxDefaultPosition);
    bool PopupMenu(wxMenu* menu, int x, int y);
    */

    /* TODO validators
    virtual wxValidator* GetValidator();
    virtual void SetValidator(const wxValidator& validator);
    */

    virtual bool TransferDataFromWindow();
    virtual bool TransferDataToWindow();
    virtual bool Validate();

    wxWindowID GetId() const;
    virtual wxString GetLabel() const;

    /* TODO
    virtual wxLayoutDirection GetLayoutDirection() const;
    virtual wxCoord AdjustForLayoutDirection(wxCoord x,
                                             wxCoord width,
                                             wxCoord widthTotal) const;
                                             */

    virtual wxString GetName() const;
    wxWindowVariant GetWindowVariant() const;
    void SetId(wxWindowID winid);
    virtual void SetLabel(const wxString& label);
    /* TODO virtual void SetLayoutDirection(wxLayoutDirection dir); */
    virtual void SetName(const wxString& name);
    void SetWindowVariant(wxWindowVariant variant);

    /* TODO 
    wxAcceleratorTable* GetAcceleratorTable();
    wxAccessible* GetAccessible();
    virtual void SetAcceleratorTable(const wxAcceleratorTable& accel);
    void SetAccessible(wxAccessible* accessible);
    */

    bool Close(bool force = false);
    virtual bool Destroy();
    bool IsBeingDeleted() const;

    /* TODO drag&drop
    virtual wxDropTarget* GetDropTarget() const;
    virtual void SetDropTarget(wxDropTarget* target);
    virtual void DragAcceptFiles(bool accept);
    */

    /* TODO constraints
    wxSizer* GetContainingSizer() const;
    wxSizer* GetSizer() const;
    void SetSizer(wxSizer* sizer, bool deleteOld = true);
    void SetSizerAndFit(wxSizer* sizer, bool deleteOld = true);
    */

    /* TODO
    wxLayoutConstraints* GetConstraints() const;
    void SetConstraints(wxLayoutConstraints* constraints);
    */

    virtual bool Layout();
    void SetAutoLayout(bool autoLayout);
    bool GetAutoLayout() const;

    void CaptureMouse();

    /* TODO wxCaret* GetCaret() const; */
    /* TODO const wxCursor& GetCursor() const; */

    virtual bool HasCapture() const;
    void ReleaseMouse();

    /* TODO void SetCaret(wxCaret* caret); */
    /* TODO virtual bool SetCursor(const wxCursor& cursor); */

    virtual void WarpPointer(int x, int y);

    /* TODO hit test
    wxHitTest HitTest(wxCoord x, wxCoord y) const;
    wxHitTest HitTest(const wxPoint& pt) const;
    */

    wxBorder GetBorder(long flags) const;
    wxBorder GetBorder() const;

    
    /* TODO virtual void DoUpdateWindowUI(wxUpdateUIEvent& event); */

    /* TODO virtual WXWidget GetHandle() const; */

    virtual bool HasMultiplePages() const;
    virtual void InheritAttributes();

    virtual void InitDialog();

    virtual bool IsRetained() const;
    bool IsThisEnabled() const;

    virtual bool IsTopLevel() const;

    /* TODO
    virtual void OnInternalIdle();
    virtual bool SendIdleEvents(wxIdleEvent& event);
    */

    virtual bool RegisterHotKey(int hotkeyId, int modifiers,
                                int virtualKeyCode);

    virtual bool UnregisterHotKey(int hotkeyId);
    virtual void UpdateWindowUI(long flags = wxUPDATE_UI_NONE);

    /* TODO static wxVisualAttributes GetClassDefaultAttributes(wxWindowVariant variant = wxWINDOW_VARIANT_NORMAL); */


    static wxWindow* FindFocus();

    static wxWindow* FindWindowById(long id, const wxWindow* parent = 0);
    static wxWindow* FindWindowByLabel(const wxString& label,
                                       const wxWindow* parent = 0);
    static wxWindow* FindWindowByName(const wxString& name,
                                      const wxWindow* parent = 0);

    static wxWindow* GetCapture();
    static wxWindowID NewControlId(int count = 1);
    static void UnreserveControlId(wxWindowID id, int count = 1);

protected:
    virtual void DoCentre(int direction);
    virtual wxSize DoGetBestSize() const;
    virtual wxSize DoGetBestClientSize() const;
    virtual int DoGetBestClientHeight(int width) const;
    virtual int DoGetBestClientWidth(int height) const;
    virtual void SetInitialBestSize(const wxSize size);
    void SendDestroyEvent();

    /* TODO events
    virtual bool ProcessEvent(wxEvent& event);
    bool SafelyProcessEvent(wxEvent& event);
    virtual void QueueEvent(wxEvent *event);
    virtual void AddPendingEvent(const wxEvent& event);
    bool ProcessThreadEvent(const wxEvent& event);
    */
    void ProcessPendingEvents();
};



// ============================================================================
// Global functions/macros
// ============================================================================

wxWindow* wxFindWindowAtPointer(wxPoint pt);
wxWindow* wxGetActiveWindow();
wxWindow* wxGetTopLevelParent(wxWindow* window);

