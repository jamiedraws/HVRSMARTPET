(function (global) {
    if ("app" in global) {
        app.require(["defer"], function () {
            const view = app.createContext(app.defer);
            const product = app.createContext(app.defer);
            const carousel = app.createContext(app.defer);
            const media = app.createContext(app.defer);

            view.hasObserve(function () {
                Observe({
                    selector: ".view--observe",
                    inRange: function (entry) {
                        entry.classList.add("view--in-view");
                    }
                });
            });

            media.addProperties({
                hasSource: function (id) {
                    return this.isString(this.getSource(element));
                },
                getSource: function (element) {
                    return element.dataset.srcIframe;
                },
                updateSource: function (element, id) {
                    const source = this.getSource(element);
                    return source.replace(/(\d{9})/, id);
                },
                getId: function (element) {
                    return element.dataset.videoId;
                },
                getIframe: function (element) {
                    return element.querySelector("iframe");
                },
                hasVimeo: function () {
                    return "Vimeo" in global;
                },
                setVimeo: function (iframe, callback) {
                    let result = false;
                    if (this.hasVimeo() && this.elementExists(iframe)) {
                        result = new Vimeo.Player(iframe);
                        if (this.isFunction(callback)) {
                            callback(result);
                        }
                    }
                    return result;
                },
                getCurrentButton: function (element, button) {
                    const lastSelectedButton = element.querySelector(".button--has-current-media");
                    if (this.elementExists(lastSelectedButton)) {
                        lastSelectedButton.classList.remove("button--has-current-media");
                    }
                    button.classList.add("button--has-current-media");
                }
            });

            media.hasObserve(function () {
                Observe({
                    selector: ".media",
                    inRange: function (element) {
                        const buttons = element.querySelectorAll("[data-video-id]"),
                            video = element.querySelector("[data-src-iframe]");
                        let iframe = media.getIframe(video), 
                            vimeo = false;

                        media.listen(buttons, function () {
                            media.getCurrentButton(element, this);
                            const id = media.getId(this),
                                source = media.updateSource(video, id);

                            if (!media.elementExists(iframe)) {
                                iframe = media.getIframe(video);
                                vimeo = media.setVimeo(iframe);
                            }

                            if (media.elementExists(iframe)) {
                                if (vimeo) {
                                    vimeo.loadVideo(id);
                                } else {
                                    iframe.src = source;
                                }
                            }
                        });
                    }
                });
            });

            product.addProperties({
                figure: document.querySelector(".product--figure"),
                list: document.querySelector(".product--list"),
                buttons: document.querySelectorAll(".product--figure button"),
                features: document.querySelectorAll(".product--list li"),
                prime: "product--is-primed",
                state: "product__is-selected",
                setPrime: function () {
                    product.list.classList.add("product--is-primed");
                    product.selectFeature.call(document.activeElement);
                },
                unsetPrime: function () {
                    product.list.classList.remove("product--is-primed");
                    product.toggleFeatures();
                },
                toggleFeatures: function (element) {
                    product.toArray(product.features)
                    .forEach(function (feature) {
                        if (feature === element) {
                            feature.classList.add(product.state);
                        } else {
                            feature.classList.remove(product.state);
                        }
                    });
                },
                selectFeature: function () {
                    const label = this.getAttribute("aria-labelledby");
                    if (product.isString(label)) {
                        const element = document.getElementById(label);
                        if (product.elementExists(element)) {
                            product.toggleFeatures(element);
                        }
                    }
                },
                toggleButtons: function (id) {
                    product.toArray(product.buttons).forEach(function (button) {
                        const label = button.getAttribute("aria-labelledby");
                        if (label === id) {
                            button.classList.add(product.state);
                        } else {
                            button.classList.remove(product.state);
                        }
                    });
                }
            });

            product.hasObserve(function () {
                Observe({
                    selector: ".view--product",
                    inRange: function () {
                        product.listen(
                            product.figure, 
                            product.setPrime,
                            "mouseenter"
                        );

                        product.listen(
                            product.list,
                            product.setPrime,
                            "mouseenter"
                        );
                
                        product.listen(
                            product.figure,
                            product.unsetPrime,
                            "mouseleave"
                        );

                        product.listen(
                            product.list,
                            function () {
                                product.unsetPrime();
                                product.toggleButtons();
                            },
                            "mouseleave"
                        );
                
                        product.listen(
                            product.buttons, 
                            product.selectFeature
                        );
                
                        product.listen(
                            product.buttons, 
                            product.selectFeature, 
                            "mouseover"
                        );
                
                        product.listen(
                            product.buttons, 
                            product.selectFeature, 
                            "focus"
                        );

                        product.listen(
                            product.features,
                            function () {
                                product.toggleFeatures(this);
                                product.toggleButtons(this.id);
                            },
                            "mouseenter"
                        );
                    }
                })
            });

            carousel.toArray(
                document.querySelectorAll(".carousel")
            ).forEach(function (carouselItem) {
                const id = "#" + carouselItem.id;

                Slide.into(
                    carouselItem, {
                        currentState: "carousel__item--current"
                    },
                    function () {
                        const self = this;
                        
                        self.handleRotation(false);
                        self.setShim(true);
                        self.watch(function (currentIndex, prevIndex) {   
                            const prevSlide = this.children.item(prevIndex),
                                currentSlide = this.children.item(currentIndex);

                            prevSlide.classList.remove(self.currentState);
                            currentSlide.classList.add(self.currentState);
                        });

                        carousel.hasObserve(function () {
                            Observe({
                                selector: id,
                                inRange: function () {
                                    self.play();
                                },
                                outRange: function () {
                                    self.pause();
                                },
                                unObserve: false
                            });
                        });
                    }
                ); 
            });

            carousel.toArray(
                document.querySelectorAll(".slide")
            ).forEach(function (slide) {
                carousel.hasObserve(function () {
                    const into = slide.querySelector(".slide__into"),
                        id = "#" + into.id;

                    Observe({
                        selector: id,
                        inRange: function () {

                            Slide.into(
                                into,
                                {
                                    container: slide,
                                    prevButton: slide.querySelector(".slide__prev"),
                                    nextButton: slide.querySelector(".slide__next"),
                                },
                                function() {
                                    const self = this;
                                    
                                    self.container.classList.add("slide--is-ready");
                
                                    self.prevButton.addEventListener("click", function() {
                                        self.prev();
                                    });
                            
                                    self.nextButton.addEventListener("click", function() {
                                        self.next();
                                    });
                                }
                            );
                        }
                    });
                });
            });
        });
    }
} (window));