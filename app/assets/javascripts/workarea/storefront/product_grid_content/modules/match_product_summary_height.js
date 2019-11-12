/**
 * @namespace WORKAREA.matchProductsummaryHeight
 */
WORKAREA.registerModule('matchProductsummaryHeight', (function () {
    'use strict';

    var maxHeight = function ($pagination) {
            var $productSummaries  = $('.product-summary', $pagination);

            return _.reduce($productSummaries, function(result, value) {
                return $(value).height() > result ? $(value).height() : result;
            }, 0);
        },

        updatecontentBlock = function ($contentBlock, numberOfRows, $pagination) {
            var height = maxHeight($pagination);
            $contentBlock.height(height * numberOfRows);
        },

        setHeight = function($scope, index, contentBlock) {
            var $contentBlock = $(contentBlock),
                contentBlockData = $contentBlock.data('matchProductSummaryHeight'),
                numberOfRows = contentBlockData.rows || 1,
                $pagination = $contentBlock.closest('.pagination');

            $contentBlock.height('100%');

            // Dont set the height if the blocktype is outside of a pagination
            // This prevents the display breaking in the admin content editor
            if (_.isEmpty($pagination)) { return; }

            // Need to wait for the stack to clear so that the height
            // is calculated by the browser in time
            _.defer(updatecontentBlock, $contentBlock, numberOfRows, $pagination);
        },

        refresh = function ($scope) {
            $('[data-match-product-summary-height]', $scope).each(_.partial(setHeight, $scope));
        },

        onResize = _.once(function($scope) {
            $(window).on('resize', _.debounce(_.partial(refresh, $scope), 200));
        }),

        init = function ($scope) {
            $('[data-match-product-summary-height]', $scope).each(_.partial(setHeight, $scope));
            onResize($scope);
        };

    return {
        init: init
    };
}()));
