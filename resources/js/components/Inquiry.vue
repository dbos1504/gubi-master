<template>
    <form>
        <button @click.prevent="$modal.show('inquiry')"
                class="px-4 py-2 border font-bold text-xs"
        >
            HAFĐU SAMBAND FYRIR UPPLÝSINGAR
        </button>
        <modal name="inquiry" classes="bg-white relative" height="auto" width="75%">
            <div class="button-cancel">
                <button type="button" @click="$modal.hide('inquiry')">X</button>
            </div>
            <form action="" method="POST" class="lg:flex lg:flex-wrap lg:items-center">
                <div class="lg:w-2/5 inquiry-image">
                    <img :src="'/img/products/' + img" :alt="product.alt">
                </div>
                <div class="lg:w-3/5 p-12">
                    <h4 class="font-serif uppercase text-center text-black text-3xl">Upplýsingar um vöru</h4>
                    <hr>
                    <div class="form-group lg:flex">
                        <div class="w-full mr-2">
                            <input class="lg:p-2 md:p-2 w-full first-name"
                                   type="text"
                                   v-model="firstname"
                                   v-validate.persist="'required'"
                                   :class="errors.first('firstname') ? 'border-b border-red-700' : 'border'"
                                   name="firstname"
                                   placeholder="First Name"
                            >
                            <span class="text-red-500 italic text-xs greska">{{ errors.first('firstname') }}</span>
                        </div>
                        <div class="w-full">
                            <input class="lg:p-2 md:p-2 w-full"
                                   type="text"
                                   v-model="lastname"
                                   v-validate.persist="'required'"
                                   name="lastname"
                                   :class="errors.first('lastname') ? 'border-b border-red-700' : 'border'"
                                   placeholder="Last Name"
                            >
                            <span class="text-red-500 italic text-xs greska">{{ errors.first('lastname') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <input class="lg:p-2 md:p-2 w-full"
                               v-model="phone"
                               type="text"
                               name="phone"
                               :class="errors.first('phone') ? 'border-b border-red-700' : 'border'"
                               v-validate.persist="'required'"
                               placeholder="Simi*">
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('phone') }}</span>
                    </div>
                    <div class="form-group">
                        <input class="lg:p-2 md:p-2 w-full"
                               type="email"
                               v-model="email"
                               :class="errors.first('email') ? 'border-b border-red-700' : 'border'"
                               v-validate.persist="'required|email'"
                               name="email"
                               placeholder="Netfang*"
                        >
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('email') }}</span>
                    </div>
                    <div class="form-group flex">
                        <p class="inquiry-border p-2 w-full border border-black text-black mr-2">{{ product.headline }} | <span class="text-xs">{{ upit }}</span></p>
                        <p v-if="variacija" class="inquiry-border text-xs product-inquiry-width p-2 border border-black text-black text-center mr-2">{{ variacija }}</p>
                        <p class="inquiry-border product-inquiry-width p-2 border border-black text-black text-center">{{ kolicina }}</p>
                    </div>
                    <div class="form-group">
                        <textarea placeholder="Message*"
                                  class="w-full lg:p-2 md:p-2 border-black"
                                  name="message"
                                  id="" cols="30" rows="5"
                                  v-model="message"
                                  :class="errors.first('message') ? 'border-b border-red-700' : 'border'"
                                  v-validate.persist="'required|min:3'"
                        ></textarea>
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('message') }}</span>
                    </div>
                    <div class="form-group text-right flex justify-end items-center">
                        <a class="text-xs font-bold mr-4" @click.prevent="cancelInquiry" href="">Cancel</a>
                        <button class="text-xs font-bold text-black py-2 px-12 border" @click.prevent="sendInquiry" type="submit">SUBMIT</button>
                    </div>
                </div>
            </form>
        </modal>
        <modal name="success" classes="bg-white relative" height="auto">
            <p class="p-20 text-green-700 font-bold">Success.</p>
        </modal>
    </form>
</template>

<script>
    export default {
        props: ['product', 'upit', 'kolicina', 'img', 'variacija'],

        data() {
            return {
                products: '',
                inquiry: this.upit,
                firstname: '',
                lastname: '',
                phone: '',
                email: '',
                message: '',
                variation: '',
                image: '',
                inq: '',
                qty: '',
            }
        },

        methods: {
            sendInquiry() {
                this.$validator.validate().then(valid => {
                    if (valid) {
                        axios.post('/product/' + this.product.location + '/inquiry' , {
                            firstname: this.firstname,
                            lastname: this.lastname,
                            email: this.email,
                            phone: this.phone,
                            message: this.message,
                            products: this.product.headline,
                            variation: this.variacija,
                            inq: this.upit,
                            qty: this.kolicina,
                            image: this.img,
                        }).then(
                            this.$modal.hide('inquiry'),
                            this.$modal.show('success'),
                            this.firstname = '',
                            this.lastname = '',
                            this.email = '',
                            this.phone = '',
                            this.message = '',
                            this.hide(),
                            this.$validator.reset(),
                        );
                    }
                });
            },

            cancelInquiry() {
                this.$modal.hide('inquiry');
                this.firstname = '';
                this.lastname = '';
                this.email = '';
                this.simi = '';
                this.message = '';
            },

            hide() {
                setTimeout(() => {
                    this.$modal.hide('success');
                }, 5000)
            },
        }
    }
</script>