/*
 * gvNIX. Spring Roo based RAD tool for Generalitat Valenciana
 * Copyright (C) 2013 Generalitat Valenciana
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Global scope for GvNIX_Fancytree_Load */
var GvNIX_Fancytree_Load;

(function(jQuery, window, document) {

	GvNIX_Fancytree_Load = function($aInput) {

		var inputData = $aInput.data();

		/**
		 * Initial configuration
		 */
		this.s = {
			/**
			 * Input Id
			 */
			"id" : $aInput.attr('id'),

			/**
			 * Controller path
			 */
			"path" : inputData.path,
			/**
			 * fancytree object
			 */
			"oTree" : null,

			/**
			 * fancytree html node
			 */
			"nTree" : null,

			/**
			 * Function to allow drag nodes into the tree
			 */
			"fnAllowDrag" : null,

			/**
			 * Function to allow drop dragged nodes into a different position
			 */
			"fnAllowDrop" : null,

			/**
			 * Function to handle custom items in fancytree context menu
			 */
			"fnContextMenu" : null,

			/**
			 * Function to handle custom items in fancytree context menu
			 */
			"fnRenderColumns" : null

		}, this.options = {
			/**
			 * Fancytree extensions
			 */
			"aExtens" : [],
			/**
			 * Tree instance is editable
			 */
			"bEditable" : inputData.editable,
			/**
			 * Enable or disable checkbox,
			 */
			"bCheckbox" : inputData.checkbox,

			/**
			 * Edition button id's
			 */
			"childButtonId" : inputData.childid,
			"createButtonId" : inputData.createid,
			"deleteButtonId" : inputData.deleteid,

			/**
			 * (Default false)
			 */
			"bReloadWholeTreeOnEdit" : inputData.reloadwholetreeonedit,

			/**
			 * Allow drag and drop (require bEditable = true) (default true)
			 */
			"bAllowDragAndDrop" : inputData.allowdraganddrop,

			/**
			 * Allow context menu when right click on a node
			 */
			"bAllowContextMenu" : inputData.contextmenu,

			/**
			 * Function name to handle if a node can be dragged by user
			 * 
			 * fn(gvnixTree, node, data) return true|false
			 */
			"sFnAllowDrag" : inputData.fnallowdrag,

			/**
			 * Function name to handle if a node can be dropped into another
			 * fn(gvnixTree, node, data) return true|false
			 */
			"sFnAllowDrop" : inputData.fnallowdrop,

			/**
			 * Function name to handle custom item events from context menu
			 */
			"sFnContextMenu" : inputData.fncontextmenu,

			/**
			 * Function name to rendering tree columns
			 */
			"sFnRenderColumns" : inputData.fnrendercolumns

		}
		this.fnConstructor();

		return this
	};

	GvNIX_Fancytree_Load.prototype = {

		/**
		 * Initializes FancyTree element
		 */
		"fnConstructor" : function() {
			var s = this.s;
			var opts = this.options;
			var nTree = jQuery("#" + s.id);
			s.nTree = nTree;

			// Create fancyTree
			nTree.fancytree(this._fnGetFancyTreeOptions());

			// Store fancyTree object
			s.oTree = nTree.fancytree("getTree");

			s.oTree.getRootNode().key = "#";

			// Enable or disable editing features
			if (opts.bEditable == false || opts.bEditable == "false") {
				opts.bEditable = false;
			} else {
				opts.bEditable = true;
				// Enable edition HTML buttons
				this._fnBindEditingButton();
			}

			// Enable or disable checkboxes
			if (opts.bCheckbox == false || opts.bCheckbox == "false") {
				opts.bCheckbox = false;
			} else {
				opts.bCheckbox = true;
			}

			// Enable or disable Drag And Drop feature
			if (opts.bAllowDragAndDrop == false
					|| opts.bAllowDragAndDrop == "false") {
				opts.bAllowDragAndDrop = false;
			} else {
				opts.bAllowDragAndDrop = true;
				// Check for user custom functions
				if (opts.sFnAllowDrag) {
					s.fnAllowDrag = this
							._fnGetFunctionByName(opts.sFnAllowDrag);
				}
				if (opts.sFnAllowDrop) {
					s.fnAllowDrop = this
							._fnGetFunctionByName(opts.sFnAllowDrop);
				}
			}

			// Enable or disable jQuery context menu feature
			if (opts.bAllowContextMenu == false
					|| opts.bAllowContextMenu == "false") {
				opts.bAllowContextMenu = false;
			} else {
				opts.bAllowContextMenu = true;
				// Check for user custom functions
				if (opts.sFnContextMenu) {
					s.fnContextMenu = this
							._fnGetFunctionByName(opts.sFnContextMenu);
				}
			}

			// Custom function to render columns on tree
			if (opts.sFnRenderColumns) {
				s.fnRenderColumns == this
						._fnGetFunctionByName(opts.sFnRenderColumns);
			}
		},

		/**
		 * Binds customizable button listeners with its edition functions
		 */
		"_fnBindEditingButton" : function() {
			this.__fnBindEditingButton();
		},

		/**
		 * Binds customizable button listeners with its edition functions
		 */
		"__fnBindEditingButton" : function() {
			var opts = this.options;
			jQuery("#" + opts.deleteButtonId).on("click",
					jQuery.proxy(this._fnDelete, this));
			jQuery("#" + opts.childButtonId).on("click",
					jQuery.proxy(this._fnAddChild, this));
			jQuery("#" + opts.createButtonId).on("click",
					jQuery.proxy(this._fnAddNode, this));
		},

		/**
		 * Reloads all tree nodes
		 */
		"fnReload" : function() {
			this.__fnReload();
		},

		/**
		 * Reloads all tree nodes
		 */
		"__fnReload" : function() {
			this.s.oTree.reload();
		},

		/**
		 * Returns the options from fancytree instance
		 * 
		 * @returns fancyOpts
		 */
		"_fnGetFancyTreeOptions" : function() {
			return this.__fnGetFancyTreeOptions();
		},

		/**
		 * Returns the options from fancytree instance
		 * 
		 * @returns fancyOpts
		 */
		"__fnGetFancyTreeOptions" : function() {
			var s = this.s;
			var opts = this.options;
			var editOptions = null;
			var fancyOpts = {
				"extensions" : opts.aExtens,
				"checkbox" : opts.bCheckbox,

				// Initial source data
				"source" : {
					"url" : s.path,
					"method" : "GET"
				},
				"lazyLoad" : jQuery.proxy(this._fnLazyLoad, this),
			};

			if (opts.bEditable) {
				opts.aExtens.push('edit');

				/*
				 * Fancytree edit extension
				 * 
				 * @see https://github.com/mar10/fancytree/wiki/Extedit
				 */
				fancyOpts.edit = {
					"triggerStart" : [ "f2", "dblclick", "shift+click",
							"mac+enter" ],
					"save" : jQuery.proxy(this._fnSave, this)
				};
				if (opts.bAllowDragAndDrop) {
					/*
					 * Fancytree drag-and-drop extension
					 * 
					 * @see https://github.com/mar10/fancytree/wiki/ExtDnd
					 */
					opts.aExtens.push('dnd');
					fancyOpts.dnd = {
						"preventVoidMoves" : false,
						"preventRecursiveMoves" : false,
						"autoExpandMS" : 500,
						"dragStart" : jQuery.proxy(this._fnDragStart, this),
						"dragEnter" : jQuery.proxy(this._fnDragEnter, this),
						"dragDrop" : jQuery.proxy(this._fnDragDrop, this)
					};
				}

				if (opts.bAllowContextMenu) {
					/*
					 * jQuery ui context menu
					 * 
					 * @see https://github.com/mar10/jquery-ui-contextmenu
					 */
					fancyOpts.contextmenu = s.nTree.contextmenu(this
							._fnGetContextMenu());
				}

				/*
				 * Fancytree table and gridnav extensions
				 * 
				 * @see https://github.com/mar10/fancytree/wiki/ExtTable
				 */
				if (s.fnRenderColumns) {
					opts.aExtens.push("table", "gridnav");

					fancyOpts.rendercolumns = s.fnRenderColumns;
				}
			}
			return fancyOpts;
		},

		/**
		 * Returns the default or custom content of context menu
		 * 
		 * @returns ctxMenu
		 */
		"_fnGetContextMenu" : function() {
			var s = this.s;
			var self = this;
			var ctxMenu;
			if (s.fnContextMenu) {
				// Use user custom context menu
				ctxMenu = s.fnContextMenu;
			} else {
				// Default context menu
				ctxMenu = {
					"delegate" : ".fancytree-node",
					"menu" : [ {
						"title" : "Add Child",
						"cmd" : "child",
						"uiIcon" : "ui-icon-arrowreturn-1-e"
					}, {
						"title" : "Add New ",
						"cmd" : "new",
						"uiIcon" : "ui-icon-plus"
					}, {
						"title" : "Refresh",
						"cmd" : "refresh",
						"uiIcon" : "ui-icon-refresh"
					}, {
						"title" : "Remove",
						"cmd" : "remove",
						"uiIcon" : "ui-icon-trash"
					}, {
						"title" : "Rename ",
						"cmd" : "rename",
						"uiIcon" : "ui-icon-pencil"
					} ],
					"select" : function(event, ui) {
						setTimeout(function() {
							self._fnMenuItemSelected(event, ui)
						}, 100);
					}
				};
			}
			return ctxMenu;
		},

		/**
		 * Choose an action for a context menu item selection
		 * 
		 * @param event
		 *            jQuery context menu event
		 * @param ui
		 *            Menu element selection data
		 */
		"_fnMenuItemSelected" : function(event, ui) {
			this.__fnMenuItemSelected(event, ui);
		},

		/**
		 * Choose an action for a context menu item selection
		 * 
		 * @param event
		 *            jQuery context menu event
		 * @param ui
		 *            Menu element selection data
		 */
		"__fnMenuItemSelected" : function(event, ui) {
			var node = jQuery.ui.fancytree.getNode(ui.target);
			node.setActive();
			switch (ui.cmd) {
			case "child":
				this._fnAddChild(event);
				break;
			case "new":
				this._fnAddNode(event);
				break;
			case "remove":
				this._fnDelete(event);
				break;
			case "rename":
				node.editStart();
				break;
			case "refresh":
				if (node.isLazy()) {
					this._fnRefreshNode(node);
				} else {
					this._fnRefreshNode(node.parent);
				}
				break;
			}
		},

		/**
		 * Enable dragging for the tree. Return false to cancel dragging of node
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 * @return true if operation allowed
		 */
		"_fnDragStart" : function(node, data) {
			return this.__fnDragStart(node, data);
		},

		/**
		 * Enable dragging for the tree. Return false to cancel dragging of node
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 * @return true if operation allowed
		 */
		"__fnDragStart" : function(node, data) {
			var fn = this.s.fnAllowDrag;
			if (fn) {
				return fn(this, node, data);
			}
			return true;
		},

		/**
		 * Return false to disallow dropping on node.
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 * @return true if operation allowed
		 */
		"_fnDragEnter" : function(node, data) {
			return this.__fnDragEnter(node, data);
		},

		/**
		 * Return false to disallow dropping on node.
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 * @return true if operation allowed
		 */
		"__fnDragEnter" : function(node, data) {
			var fn = this.s.fnAllowDrop;
			if (fn) {
				return fn(this, node, data);
			}
			return true;
		},

		/**
		 * To do when an item is dropped on the tree
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 */
		"_fnDragDrop" : function(node, data) {
			return this.__fnDragDrop(node, data);
		},

		/**
		 * To do when an item is dropped on the tree
		 * 
		 * @param node
		 *            Dragged node object
		 * @param data
		 *            Tree status before start dragging
		 */
		"__fnDragDrop" : function(node, data) {
			this._fnMoveNode(node, data);
		},

		/**
		 * Move a node to other position into the tree
		 * 
		 * @param node
		 *            To be moved node
		 * @param data
		 *            Current tree status
		 */
		"_fnMoveNode" : function(node, data) {
			this.__fnMoveNode(node, data);
		},

		/**
		 * Move a node to other position into the tree
		 * 
		 * @param node
		 *            To be moved node
		 * @param data
		 *            Current tree status
		 */
		"__fnMoveNode" : function(node, data) {
			var self = this;
			var action = "move";

			// Dragged node
			var oNode = data.otherNode;

			// Drop target
			if (data.hitMode == "over") {
				var target = node;
			} else {
				// Keep on same tree level
				var target = node.parent;
			}

			// Call to update method on controller
			jQuery.ajax({
				"url" : this.s.path + "/update",
				"method" : "POST",
				"data" : {
					"id" : oNode.key,
					"position" : 0,
					"parent" : target.key
				}
			}).done(function() {
				self._fnUpdateDone(action, data);
			}).fail(
					function(jqXHR, textStatus, errorThrown) {
						self._fnRequestFailed(null, oNode, action, jqXHR,
								textStatus, errorThrown)
					});
		},

		/**
		 * On expand node: request child data from the expanded node
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"_fnLazyLoad" : function(event, data) {
			this.__fnLazyLoad(event, data);
		},

		/**
		 * On expand node: request child data from the expanded node
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"__fnLazyLoad" : function(event, data) {
			var s = this.s;
			var node = data.node;
			data.result = {
				"url" : s.path,
				"method" : "GET",
				"data" : {
					"id" : node.key
				}
			}
		},

		/**
		 * To do when a node modification is submited
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"_fnSave" : function(event, data) {
			var s = this.s;
			var node = data.node;
			var input = data.input;
			var parent = node.parent;
			var self = this;
			var action = "update";
			var creating = jQuery(node[node.tree.statusClassPropName])
					.hasClass("fancytree-edit-new");
			if (creating) {
				// Creating a new node instead of updating an already existing
				// one
				action = "create";
			}
			// Ajax request to appropriate method on controller
			var url = s.path + "/" + action;
			jQuery.ajax({
				"url" : url,
				"method" : "POST",
				"data" : {
					"id" : node.key,
					"text" : input.val(),
					"position" : 0,
					"parent" : parent.key
				}
			}).done(function() {
				if (creating) {
					self._fnUpdateDone(event, data);
				} else {
					self._fnCreateDone(event, data);
				}
			}).fail(
					function(jqXHR, textStatus, errorThrown) {
						self._fnRequestFailed(event, data, action, jqXHR,
								textStatus, errorThrown)
					}).always(function() {
				input.removeClass("pending");
			})

		},

		/**
		 * Delete a node from tree
		 * 
		 * @param event
		 *            The operation who called this function
		 */
		"_fnDelete" : function(event) {
			var s = this.s;
			var node = s.oTree.getActiveNode();
			var self = this;

			if (!node) {
				// There isn't any active node
				console.log("Please activate a node.");
				return;
			}

			jQuery.ajax({
				"url" : s.path + "/delete",
				"method" : "POST",
				"data" : {
					"id" : node.key,
				}
			}).done(function() {
				self._fnDeleteDone(event, node);
			}).fail(
					function(jqXHR, textStatus, errorThrown) {
						self._fnRequestFailed(event, null, "delete", jqXHR,
								textStatus, errorThrown);
					});
		},

		/**
		 * Add a child node into a node
		 * 
		 * @param event
		 *            jQuery event call
		 */
		"_fnAddChild" : function(event) {
			var s = this.s;
			var node = s.oTree.getActiveNode();

			if (!node) {
				// There isn't any active node
				console.log("Please activate a parent node.");
				return;
			}
			// Add a child into active node
			// {Callback to _fnSave}
			node.editCreateNode("child", "");
		},

		/**
		 * Add a new node into the tree
		 * 
		 * @param event
		 *            jQuery event call
		 */
		"_fnAddNode" : function(event) {
			var s = this.s;
			var node = s.oTree.getActiveNode();
			if (node) {
				// If active node, create sibling
				// {Callback to _fnSave}
				node.editCreateNode("after", "");
			} else {
				// If no active node, create child of root
				node = s.oTree.rootNode;
				// {Callback to _fnSave}
				node.editCreateNode("child", "");
			}
		},

		/**
		 * On failed ajax request to controller
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 * @param action
		 *            [create, update, delete,...]
		 * @param jQuery
		 *            XMLHttpRequest object
		 * @param textStatus
		 *            Request status sent by the controller
		 * @param errorThrown
		 *            error message received from server
		 * 
		 */
		"_fnRequestFailed" : function(event, data, action, jqXHR, textStatus,
				errorThrown) {
			console.log("ERROR [" + action + "]: " + errorThrown);
			switch (action) {
			case "update":
				data.node.setTitle(data.orgTitle);
				break;
			case "delete":
				fnRefreshNode(data.node.parent);
				break;
			case "create":
				data.node.remove();
				break;
			case "move":
				break;
			}
			return false;
		},

		/**
		 * On successful node editing request to controller
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"_fnUpdateDone" : function(event, data) {
			this.__fnUpdateDone(event, data);
		},

		/**
		 * On successful node editing request to controller (private method)
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"__fnUpdateDone" : function(event, data) {
			// Refresh necessary data
			if (this.options.bReloadWholeTreeOnEdit) {
				this.fnReload();
			} else {
				this._fnRefreshNode(data.node.parent);
			}
		},

		/**
		 * On successful node deletion request to controller
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param node
		 *            Tree node element removed
		 */
		"_fnDeleteDone" : function(event, node) {
			this.__fnDeleteDone(event, node);
		},

		/**
		 * On successful node deletion request to controller (private method)
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param node
		 *            Tree node element removed
		 */
		"__fnDeleteDone" : function(event, node) {
			// Refresh necessary data
			if (this.options.bReloadWholeTreeOnEdit) {
				this.fnReload();
			} else {
				this._fnRefreshNode(node.parent);
			}
		},

		/**
		 * On successful node creation request to controller
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"_fnCreateDone" : function(event, data) {
			this.__fnCreateDone(event, data);
		},

		/**
		 * On successful node creation request to controller
		 * 
		 * @param event
		 *            The operation who called this function
		 * @param data
		 *            Tree element context data
		 */
		"__fnCreateDone" : function(event, data) {
			// Refresh necessary data
			if (this.options.bReloadWholeTreeOnEdit) {
				this.fnReload();
			} else {
				this._fnRefreshNode(data.node.parent);
			}
		},

		/**
		 * Reload a node data including its child
		 * 
		 * @param sKey
		 *            Target node unique key
		 * @returns false if node cannot be found in tree
		 */
		"fnRefreshNode" : function(sKey) {
			var s = this.s;
			var oNode = s.oTree.getNodeByKey(sKey);
			if (oNode) {
				this._fnRefreshNode(oNode);
			} else {
				return false;
			}
		},

		/**
		 * Reload a node data including its child
		 * 
		 * @param oNode
		 *            target node object
		 */
		"_fnRefreshNode" : function(oNode) {
			this.__fnRefreshNode(oNode);
		},

		/**
		 * Reload a node data including its child
		 * 
		 * @param oNode
		 *            target node object
		 */
		"__fnRefreshNode" : function(oNode) {
			var s = this.s;

			// if node is on first level
			if (oNode.isRoot()) {
				// reload whole tree
				this.fnReload();
			} else {
				// Save current node state
				var bExpanded = oNode.isExpanded();

				// force lazy loading of node
				oNode.resetLazy();

				if (bExpanded) {
					oNode.setExpanded(true, {
						noAnimation : true
					});
				}

			}
		},

		/**
		 * Gets a function by name
		 * 
		 * @param sfnName
		 *            function name
		 * @param fnDebug
		 *            (optional) debug function to call when a problem found
		 * 
		 * @returns function instance or null
		 */
		"_fnGetFunctionByName" : function(sfnName) {
			var fn = window[sfnName];
			if (!fn) {
				console.log("ERROR: function '" + sfnName + "' not found");
				return null;
			} else if (typeof fn != "function") {
				console.log("ERROR: function '" + sfnName + "' not found");
				return null;
			}
			return fn;
		}
	};

})(jQuery, window, document);

// Registering events
fnRegisterFunctionsToCallBack(function(context) {
	jQuery(".treeview_control", context).each(function(index) {
		new GvNIX_Fancytree_Load(jQuery(this));
	});
});