<template>
    <form>
        <button @click.prevent="$modal.show('inquiry')"
                class="px-4 py-2 border font-bold text-xs"
        >
            HAFĐU SAMBAND FYRIR UPPLÝSINGAR
        </button>
        <modal name="inquiry" classes="bg-white relative" height="auto" width="65%">
            <div class="button-cancel">
                <button type="button" @click="$modal.hide('inquiry')">X</button>
            </div>
            <form action="" method="POST" class="lg:flex lg:flex-wrap lg:items-center">
                <div class="lg:w-2/5">
                    <img :src="'/img/products/' + img" :alt="products.alt">
                </div>
                <div class="lg:w-3/5 p-12">
                    <h4 class="font-serif uppercase text-center text-black text-3xl">Upplýsingar um vöru</h4>
                    <hr>
                    <div class="form-group lg:flex">
                        <div class="w-full mr-2">
                            <input class="p-2 w-full"
                                   type="text"
                                   v-model="firstname"
                                   v-validate="'required'"
                                   :class="errors.first('firstname') ? 'border-b border-red-700' : 'border'"
                                   name="firstname"
                                   placeholder="First Name"
                            >
                            <span class="text-red-500 italic text-xs greska">{{ errors.first('firstname') }}</span>
                        </div>
                        <div class="w-full">
                            <input class="p-2 w-full"
                                   type="text"
                                   v-model="lastname"
                                   v-validate="'required'"
                                   name="lastname"
                                   :class="errors.first('lastname') ? 'border-b border-red-700' : 'border'"
                                   placeholder="Last Name"
                            >
                            <span class="text-red-500 italic text-xs greska">{{ errors.first('lastname') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <input class="p-2 w-full"
                               v-model="simi"
                               type="text"
                               name="simi"
                               :class="errors.first('simi') ? 'border-b border-red-700' : 'border'"
                               v-validate="'required'"
                               placeholder="Simi*">
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('simi') }}</span>
                    </div>
                    <div class="form-group">
                        <input class="p-2 w-full"
                               type="email"
                               v-model="email"
                               :class="errors.first('email') ? 'border-b border-red-700' : 'border'"
                               v-validate="'required'"
                               name="email"
                               placeholder="Netfang*"
                        >
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('email') }}</span>
                    </div>
                    <div class="form-group flex">
                        <p class="p-2 w-full border border-black text-black mr-2">{{ products.headline }} | {{ upit }}</p>
                        <p class="product-inquiry-width p-2 border border-black text-black text-center">{{ kolicina }}</p>
                    </div>
                    <div class="form-group">
                        <textarea placeholder="Message*"
                                  class="w-full p-2 border-black"
                                  name="message"
                                  id="" cols="30" rows="5"
                                  v-model="message"
                                  :class="errors.first('message') ? 'border-b border-red-700' : 'border'"
                                  v-validate="'required'"
                        ></textarea>
                        <span class="text-red-500 italic text-xs greska">{{ errors.first('message') }}</span>
                    </div>
                    <div class="form-group text-right">
                        <button class="text-xs font-bold text-black py-2 px-12 border" @click.prevent="sendInquiry" type="submit">SUBMIT</button>
                    </div>
                </div>
            </form>
        </modal>
    </form>
</template>

<script>
    export default {
        props: ['product', 'upit', 'kolicina', 'img'],

        data() {
            return {
                products: this.product,
                inquiry: this.upit,
                firstname: '',
                lastname: '',
                simi: '',
                email: '',
                message: '',
            }
        },

        methods: {
            sendInquiry() {
                this.$validator.validate().then(valid => {
                    if (valid) {
                        axios.post('/', {
                            firstname: this.firstname,
                            lastname: this.lastname,
                            email: this.email,
                            simi: this.simi,
                            message: this.message,
                        }).then(
                            this.$modal.show('success'),
                            this.firstname = '',
                            this.lastname = '',
                            this.email = '',
                            this.simi = '',
                            this.message = '',
                            this.$validator.reset(),
                            this.hide(),
                        );
                    }
                });
            },

            hide() {
                setTimeout(() => {
                    this.$modal.hide('success');
                }, 5000)
            },
        }
    }
</script>

<style scoped>

</style>