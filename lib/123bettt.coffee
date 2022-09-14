123betttView = require './123bettt-view'
{CompositeDisposable} = require 'atom'

module.exports = 123bettt =
  123betttView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @123betttView = new 123betttView(state.123betttViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @123betttView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', '123bettt:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @123betttView.destroy()

  serialize: ->
    123betttViewState: @123betttView.serialize()

  toggle: ->
    console.log '123bettt was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
