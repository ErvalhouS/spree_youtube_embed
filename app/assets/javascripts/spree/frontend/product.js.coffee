Spree.ready ($) ->
    Spree.addImageHandlers = ->
        thumbnails = ($ '#product-images ul.thumbnails')
        ($ '#main-image').data 'selectedThumb', ($ '#main-image img').attr('src')
        thumbnails.find('li').eq(0).addClass 'selected'
        thumbnails.find('a').on 'click', (event) ->
            if not ($ event.currentTarget).parent('li').hasClass('video')
                ($ '#main-image iframe').remove()
                ($ '#main-image img').remove()
                $('.panel-body').prepend($('<img>',{id:'theImg',src:($ event.currentTarget).attr('href')}))
                false
            else
                ($ '#main-image iframe').remove()
                ($ '#main-image img').remove()
                $('<iframe>', {src: "//www.youtube.com/embed/"+($ event.currentTarget).attr('href').split("=")[($ event.currentTarget).attr('href').split("=").length-1],id:  'videoIframe'
                }).appendTo('.panel-body')
                false



    Spree.showVariantImages = (variantId) ->
        ($ 'li.vtmb').hide()
        ($ 'li.tmb-' + variantId).show()
        currentThumb = ($ '#' + ($ '#main-image').data('selectedThumbId'))
        if not currentThumb.hasClass('vtmb-' + variantId)
            thumb = ($ ($ '#product-images ul.thumbnails li:visible.vtmb').eq(0))
            thumb = ($ ($ '#product-images ul.thumbnails li:visible').eq(0)) unless thumb.length > 0
            newImg = thumb.find('a').attr('href')
            ($ '#product-images ul.thumbnails li').removeClass 'selected'
            thumb.addClass 'selected'
            if not currentThumb.hasClass('video')
                ($ '#main-image iframe').remove()
                ($ '#main-image img').remove()
                $('.panel-body').prepend($('<img>',{id:'theImg',src: currentThumb.find('a').attr('href')}))
                ($ '#main-image').data 'selectedThumbVideo', "0"
            else
                ($ '#main-image img').hide()
                $('<iframe>', {
                    src: "//www.youtube.com/embed/"+newImg.split("=")[newImg.split("=").length-1],
                    id:  'videoIframe',
                }).appendTo('.panel-body');
                ($ '#main-image').data 'selectedThumbVideo', "1"
            ($ '#main-image').data 'selectedThumb', newImg
            ($ '#main-image').data 'selectedThumbId', thumb.attr('id')

    Spree.updateVariantPrice = (variant) ->
        variantPrice = variant.data('price')
        ($ '.price.selling').text(variantPrice) if variantPrice
    radios = ($ '#product-variants input[type="radio"]')

    if radios.length > 0
        selectedRadio = ($ '#product-variants input[type="radio"][checked="checked"]')
        Spree.showVariantImages selectedRadio.attr('value')
        Spree.updateVariantPrice selectedRadio

    Spree.addImageHandlers()

    radios.click (event) ->
        Spree.showVariantImages @value
        Spree.updateVariantPrice ($ this)
