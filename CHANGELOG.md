Workarea Product Grid Content 1.3.0 (2019-06-25)
--------------------------------------------------------------------------------

*   Adds a new in grid content block leveraging insights data.

    The new insights grid cell block type allows retailers to strategically insert products, driven by insights data, at any position within their category browse page and search customization product grids
    Workarea minimum version requirement bumped to v3.4 to support new insight types

    WPGC-20
    Jake Beresford

*   Add link to cover background image

    Due to implementation of image as a CSS background the link is applied as an absolutely-relative positioned element which covers the background, and is behind the content area, allowing that text to remain accessible.

    WPGC-4
    Jake Beresford



Workarea Product Grid Content 1.2.0 (2019-02-19)
--------------------------------------------------------------------------------

*   Add test for in grid content on search customizations

    WPGC-18
    Jake Beresford

*   Allow in-grid content for search customizations

    * Update configuration to add in-grid area to search cusotmizations
    * Add logic to read content for in grid area from customization in search controller

    WPGC-18
    Jake Beresford



Workarea Product Grid Content 1.1.0 (2018-11-13)
--------------------------------------------------------------------------------

*   Update block type definition to use find_asset_id_by_file_name

    * Minimum Workarea version requirement is now v3.1.13

    WPGC-17
    Jake Beresford

*   Sets the content image as a background image

    The change caused the content block to collapse in the admin preview since
    the content is positioned with absolute relativity. In order to make this
    block work properly in the admin a new layout was added for content previews
    in any 'in grid' area.

    * Adds config for number of products to display in grid preview.
    * Renders the content block in a relevant position in the grid.
    * Add calculation for preview position to grid_content view model, allowing
    the preview position to look good and work for cell width, cell height,
    and position controls.

    WPGC-9
    Jake Beresford

*   Add tooltips to blocktype definition

    WPGC-7
    Jake Beresford

*   Allow admin user to specify a background color in lieu of an image

    WPGC-10
    Jake Beresford



Workarea Product Grid Content 1.0.2 (2018-10-02)
--------------------------------------------------------------------------------

*   Fix pagination on firefox

    * Extends clearfix in .pagination to allow for floated content blocks within the paged product results
    * Add missing heading class to improve developer experience

    WPGC-14
    Jake Beresford



Workarea Product Grid Content 1.0.1 (2018-05-24)
--------------------------------------------------------------------------------

*   Clean up markdown formatting of readme

    WPGC-12
    Dave Barnow



Workarea Product Grid Content 1.0.0 (2018-03-22)
--------------------------------------------------------------------------------



