<template>
    <div>
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
                    <div class="form-group flex">
                        <input class="p-2 border w-full mr-2" type="text" v-model="firstname" name="firstname" placeholder="First Name">
                        <input class="p-2 border w-full" type="text" v-model="lastname" name="lastname" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input class="p-2 border w-full" v-model="simi" type="text" name="simi" placeholder="Simi*">
                    </div>
                    <div class="form-group">
                        <input class="p-2 border w-full" type="email" v-model="email" name="email" placeholder="Netfang*">
                    </div>
                    <div class="form-group flex">
                        <p class="p-2 w-full border border-black text-black mr-2">{{ products.headline }} | {{ upit }}</p>
                        <p class="product-inquiry-width p-2 border border-black text-black text-center">{{ kolicina }}</p>
                    </div>
                    <div class="form-group">
                        <textarea placeholder="Message*" class="w-full p-2 border border-black" name="messageText" id="" cols="30" rows="5" v-model="message"></textarea>
                    </div>
                    <div class="form-group text-right">
                        <button class="text-xs font-bold text-black py-2 px-12 border" type="submit">SUBMIT</button>
                    </div>
                </div>
            </form>
        </modal>
    </div>
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
        }
    }
</script>

<style scoped>

</style>